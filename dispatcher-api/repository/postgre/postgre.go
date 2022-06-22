package postgre

import (
	"database/sql"
	"dispatcher-api/repository"
	"log"

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

func (r *postgreRepository) Ping(db *sql.DB) error {
	err := db.Ping()
	if err != nil {
		return err
	}

	log.Println("Successfully Ping!")

	return nil
}

func (r *postgreRepository) Close() error {
	return nil
}
func (r *postgreRepository) FindByID() error {
	return nil
}
func (r *postgreRepository) Find() error {
	return nil
}
func (r *postgreRepository) Create() error {
	return nil
}
func (r *postgreRepository) Update() error {
	return nil
}
func (r *postgreRepository) Delete() error {
	return nil
}
