package service

import (
	"context"
	"dispatcher-api/models"
	"dispatcher-api/repository"
)

type RepoService interface {
	SelectShippingCompany(context.Context, models.Deliverys) (*models.Shipment, error)
}

type repoService struct {
	repo repository.Repository
}

func NewRepoSerivce(repo repository.Repository) RepoService {
	return &repoService{
		repo: repo,
	}
}

func (r *repoService) SelectShippingCompany(c context.Context, deliverys models.Deliverys) (*models.Shipment, error) {
	return nil, nil
}
