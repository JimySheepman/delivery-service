package postgre

import (
	"context"
	"database/sql"
	"dispatcher-api/models"
	"dispatcher-api/repository"
	"fmt"

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
	var shipments []models.Shipment
	for _, delivery := range deliveries.Deliveries {
		k, err := r.selectSuitableCompanies(&delivery)
		if err != nil {
			return nil, err
		}

		j, err := r.selectFasterCompanies(k)
		if err != nil {
			return nil, err
		}

		l, err := r.selectContractedCompanies(j)
		if err != nil {
			return nil, err
		}

		shipments = append(shipments, *l)
	}
	fmt.Println(shipments)
	return nil, nil
}

func (r *postgreRepository) selectSuitableCompanies(delivery *models.Delivery) (*models.SuitableCompanies, error) {
	return nil, nil
}

func (r *postgreRepository) selectFasterCompanies(suitableCompanies *models.SuitableCompanies) (*models.FasterCompanies, error) {
	return nil, nil
}

func (r *postgreRepository) selectContractedCompanies(fasterCompanies *models.FasterCompanies) (*models.Shipment, error) {
	return nil, nil
}

func (r *postgreRepository) selectionMaxQuota(c context.Context, deliveries *models.Deliveries) (*models.Shipment, error) {
	return nil, nil
}
