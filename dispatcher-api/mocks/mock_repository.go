package mocks

import (
	"context"
	"dispatcher-api/models"
)

type postgreMockRepository struct {
	selectShippingCompany map[int]error
}

func NewMockRepository() *postgreMockRepository {
	return &postgreMockRepository{
		selectShippingCompany: map[int]error{},
	}
}

func (r *postgreMockRepository) SelectShippingCompany(c context.Context, deliveries *models.Deliveries) (*models.Shipment, error) {
	return nil, nil
}
