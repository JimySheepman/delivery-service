package controllers

import (
	"dispatcher-api/service"

	"github.com/gofiber/fiber/v2"
)

type RepoController struct {
	repoService service.RepoService
}

func NewController(service service.RepoService) *RepoController {
	return &RepoController{
		repoService: service,
	}
}

func (rc *RepoController) Healthcheck(c *fiber.Ctx) error {
	return nil
}
