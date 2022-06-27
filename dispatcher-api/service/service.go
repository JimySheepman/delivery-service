package service

import (
	"context"
	"dispatcher-api/models"
	"dispatcher-api/repository"
)

type RepoService interface {
	SelectShippingCompany(context.Context, models.Deliveries) (*models.Shipment, error)
}

type repoService struct {
	repo repository.Repository
}

func NewRepoSerivce(repo repository.Repository) RepoService {
	return &repoService{
		repo: repo,
	}
}

func (s *repoService) SelectShippingCompany(c context.Context, deliverys models.Deliveries) (*models.Shipment, error) {
	shipment, err := s.repo.SelectShippingCompany(c, deliverys)
	if err != nil {
		return nil, err
	}
	return shipment, nil
}
