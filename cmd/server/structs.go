package main

type ActionPayload struct {
	SessionVariables map[string]interface{} `json:"session_variables"`
	Input            interface{}            `json:"input"`
}

type GraphQLError struct {
	Message string `json:"message"`
}

type CreateAccountInput struct {
	Inp struct {
		Username string `json:"username"`
		Password string `json:"password"`
	} `json:"inp"`
}

type SignInInput struct {
	Inp struct {
		Username string `json:"username"`
		Password string `json:"password"`
	} `json:"inp"`
}

type AuthOutput struct {
	AccessToken string
}
