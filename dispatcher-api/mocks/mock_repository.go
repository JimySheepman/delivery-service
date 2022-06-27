package mock

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

func (r *postgreMockRepository) SelectShippingCompany(c context.Context, deliverys models.Deliveries) (*models.Shipment, error) {
	return nil, nil
}
