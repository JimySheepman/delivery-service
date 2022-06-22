package service

import "dispatcher-api/repository"

type RepoService interface {
}

type repoService struct {
	repo repository.Repository
}

func NewRepoSerivce(repo repository.Repository) RepoService {
	return &repoService{
		repo: repo,
	}
}
