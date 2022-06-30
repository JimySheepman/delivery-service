package postgre

import (
	"context"
	"database/sql"
	"dispatcher-api/models"
	"dispatcher-api/repository"

	_ "github.com/lib/pq"
)

type postgreRepository struct {
	postgre *sql.DB
}

func NewPostgreRepository(postgreConnection *sql.DB) repository.Repository {
	return &postgreRepository{
		postgre: postgreConnection,
	}
}

func (r *postgreRepository) SelectShippingCompany(c context.Context, deliveries *models.Deliveries) (*models.Shipment, error) {
	return nil, nil
}
