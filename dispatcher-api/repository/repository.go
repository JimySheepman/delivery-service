package repository

import (
	"database/sql"
)

type Repository interface {
	Ping(*sql.DB) error
	Close() error
	FindByID() error
	Find() error
	Create() error
	Update() error
	Delete() error
}
