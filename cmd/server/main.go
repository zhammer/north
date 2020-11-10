package main

import (
	"context"
	"encoding/json"
	"log"
	"net"
	"net/http"
	"north/internal/jwt"
	"north/internal/north"
	"strconv"
	"strings"

	"github.com/go-pg/pg/v10"
	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	Port        int
	DatabaseURL string `envconfig:"database_url" required:"true"`
	JWTSecret   string `envconfig:"jwt_secret" required:"true"`
}

func main() {
	cfg := Config{}
	err := envconfig.Process("", &cfg)
	if err != nil {
		log.Fatal(err)
	}

	mux, err := makeServer(cfg)
	if err != nil {
		log.Fatal(err)
	}

	http.ListenAndServe(net.JoinHostPort("", strconv.Itoa(cfg.Port)), mux)
}

func makeServer(cfg Config) (http.Handler, error) {
	jwtClient := jwt.NewClient([]byte(cfg.JWTSecret))

	opt, err := pg.ParseURL(cfg.DatabaseURL)
	if err != nil {
		return nil, err
	}

	db := pg.Connect(opt)
	if err := db.Ping(context.Background()); err != nil {
		return nil, err
	}

	n, err := north.NewNorth(north.WithDB(db))
	if err != nil {
		return nil, err
	}

	mux := http.NewServeMux()

	mux.HandleFunc("/v1/actions/auth/sign_in", func(w http.ResponseWriter, r *http.Request) {
		data := ActionPayload{}
		input := SignInInput{}
		data.Input = &input

		if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		user, err := n.SignIn(r.Context(), input.Inp.Username, input.Inp.Password)
		if err != nil {
			writeGqlError(w, err)
			return
		}

		accessToken, err := jwtClient.Build(*user)
		if err != nil {
			writeGqlError(w, err)
			return
		}

		output := AuthOutput{accessToken}
		body, _ := json.Marshal(output)
		w.Write(body)
	})

	mux.HandleFunc("/v1/actions/auth/create_account", func(w http.ResponseWriter, r *http.Request) {
		data := ActionPayload{}
		input := CreateAccountInput{}
		data.Input = &input

		if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		user, err := n.CreateAccount(r.Context(), input.Inp.Username, input.Inp.Password)
		if err != nil {
			writeGqlError(w, err)
			return
		}

		accessToken, err := jwtClient.Build(*user)
		if err != nil {
			writeGqlError(w, err)
			return
		}

		output := AuthOutput{accessToken}
		body, _ := json.Marshal(output)
		w.Write(body)
	})

	mux.HandleFunc("/v1/auth_hook", func(w http.ResponseWriter, r *http.Request) {
		authHeader := r.Header.Get("authorization")
		if authHeader == "" {
			data := map[string]string{
				"x-hasura-role": "unauthorized",
			}
			body, _ := json.Marshal(data)
			w.Write(body)
			return
		}

		token := strings.TrimPrefix(authHeader, "Bearer ")
		if token == "" {
			http.Error(w, "invalid bearer token", http.StatusUnauthorized)
			return
		}

		claims, err := jwtClient.Parse(token)
		if err != nil {
			http.Error(w, err.Error(), http.StatusUnauthorized)
			return
		}

		data := map[string]string{
			"x-hasura-user-id": strconv.Itoa(claims.XHasuraUserID),
			"x-hasura-role":    claims.XHasuraRole,
		}

		body, _ := json.Marshal(data)
		w.Write(body)
	})

	return mux, nil
}

func writeGqlError(w http.ResponseWriter, errorToWrite error) {
	gqlError := GraphQLError{errorToWrite.Error()}
	body, _ := json.Marshal(gqlError)
	w.WriteHeader(http.StatusBadRequest)
	w.Write(body)
}
