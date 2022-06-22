package service

import (
	"database/sql"
	"dispatcher-api/repository"
)

type RepoService interface {
	Ping(*sql.DB) error
	Close() error
	FindByID() error
	Find() error
	Create() error
	Update() error
	Delete() error
}

type repoService struct {
	repo repository.Repository
}

func NewRepoSerivce(repo repository.Repository) RepoService {
	return &repoService{
		repo: repo,
	}
}

func (r *repoService) Ping(s *sql.DB) error {
	return nil
}

func (r *repoService) Close() error {
	return nil
}
func (r *repoService) FindByID() error {
	return nil
}
func (r *repoService) Find() error {
	return nil
}
func (r *repoService) Create() error {
	return nil
}
func (r *repoService) Update() error {
	return nil
}
func (r *repoService) Delete() error {
	return nil
}
