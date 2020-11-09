package jwt

import (
	"fmt"
	"north/internal/north"
	"time"

	"github.com/dgrijalva/jwt-go"
	jwtutil "github.com/dgrijalva/jwt-go"
)

var signingMethod = jwtutil.SigningMethodHS256

type Client struct {
	secret []byte
}

type Claims struct {
	XHasuraUserID int    `json:"x-hasura-user-id"`
	XHasuraRole   string `json:"x-hasura-role"`
	jwtutil.StandardClaims
}

func (c *Client) Build(user north.User) (string, error) {
	token := jwt.NewWithClaims(signingMethod, Claims{
		XHasuraUserID: user.ID,
		XHasuraRole:   "user",
		StandardClaims: jwtutil.StandardClaims{
			ExpiresAt: time.Now().Add(time.Minute * 60 * 24 * 7).Unix(),
		},
	})
	tokenString, err := token.SignedString(c.secret)
	if err != nil {
		return "", err
	}
	return tokenString, nil
}

func (c *Client) Parse(tokenString string) (*Claims, error) {
	token, err := jwtutil.ParseWithClaims(tokenString, &Claims{}, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}

		return c.secret, nil
	})
	if err != nil {
		return nil, err
	}
	if claims, ok := token.Claims.(*Claims); ok && token.Valid {
		return claims, nil
	}
	return nil, fmt.Errorf("invalid claims")
}

func NewClient(secret []byte) *Client {
	return &Client{secret}
}
