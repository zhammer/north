package north

import (
	"context"

	"github.com/go-pg/pg/v10"
)

type NorthOption func(n *North)

type North struct {
	db *pg.DB
}

func (n *North) LogIn(ctx context.Context, username string, password string) (*User, error) {
	user := User{}
	_, err := n.db.QueryOne(&user, `
		SELECT id, username FROM users WHERE username = ? AND password = crypt(?, password);
	`, username, password)
	if err != nil {
		return nil, err
	}

	return &user, nil
}

func (n *North) SignUp(ctx context.Context, username string, password string) (*User, error) {
	if err := validPassword(password); err != nil {
		return nil, err
	}

	user := User{}
	_, err := n.db.QueryOne(&user, `
		INSERT INTO users (username, password) VALUES (?, crypt(?, gen_salt('bf', 8)))
		RETURNING id, username;
	`, username, password)
	if err != nil {
		return nil, err
	}

	return &user, nil
}

func WithDB(db *pg.DB) NorthOption {
	return func(n *North) {
		n.db = db
	}
}

func NewNorth(opts ...NorthOption) (*North, error) {
	n := &North{}
	for _, opt := range opts {
		opt(n)
	}

	return n, nil
}
