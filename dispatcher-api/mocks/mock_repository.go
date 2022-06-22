package mock

import "database/sql"

type postgreMockRepository struct {
	ping     map[int]error
	close    map[int]error
	findByID map[int]error
	find     map[int]error
	create   map[int]error
	update   map[int]error
	delete   map[int]error
}

func NewMockRepository() *postgreMockRepository {
	return &postgreMockRepository{
		ping:     map[int]error{},
		close:    map[int]error{},
		findByID: map[int]error{},
		find:     map[int]error{},
		create:   map[int]error{},
		update:   map[int]error{},
		delete:   map[int]error{},
	}
}

func (r *postgreMockRepository) Ping(s *sql.DB) error {
	return nil
}

func (r *postgreMockRepository) Close() error {
	return nil
}
func (r *postgreMockRepository) FindByID() error {
	return nil
}
func (r *postgreMockRepository) Find() error {
	return nil
}
func (r *postgreMockRepository) Create() error {
	return nil
}
func (r *postgreMockRepository) Update() error {
	return nil
}
func (r *postgreMockRepository) Delete() error {
	return nil
}
