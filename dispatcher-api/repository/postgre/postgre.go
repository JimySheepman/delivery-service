package postgre

import (
	"database/sql"
	"dispatcher-api/models"
	"dispatcher-api/repository"
	"log"
	"os"

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
