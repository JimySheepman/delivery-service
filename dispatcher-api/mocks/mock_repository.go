package mock

import "database/sql"

type postgreMockRepository struct {
	selectShippingCompany map[int]error
}

func NewMockRepository() *postgreMockRepository {
	return &postgreMockRepository{
		selectShippingCompany: map[int]error{},
	}
}

func (r *postgreMockRepository) SelectShippingCompany(s *sql.DB) error {
	return nil
}
