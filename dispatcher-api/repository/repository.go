package repository

import (
	"database/sql"
	"dispatcher-api/models"
	"log"
	"os"
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

func Connection(dsnDTO models.PostgreConnectionDTO) (*sql.DB, error) {
	dns, err := dsnDTO.GenerateDNS()
	if err != nil {
		return nil, err
	}

	db, err := sql.Open(os.Getenv("DRIVERNAME"), dns)
	if err != nil {
		return nil, err
	}

	log.Println("Successfully connected!")
	return db, nil
}
