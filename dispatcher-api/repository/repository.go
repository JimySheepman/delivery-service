package repository

import (
	"context"
	"database/sql"
	"dispatcher-api/models"
	"log"
	"os"
)

type Repository interface {
	SelectShippingCompany(context.Context, models.Deliveries) (*models.Shipment, error)
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

	err = db.Ping()
	if err != nil {
		return nil, err
	}

	log.Println("Successfully connected!")
	return db, nil
}
