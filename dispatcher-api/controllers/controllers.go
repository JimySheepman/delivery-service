package controllers

import (
	"context"
	"dispatcher-api/models"
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
	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"status":  "Success",
		"message": "The system is healthy.",
	})
}

func (rc *RepoController) SelectShippingCompany(c *fiber.Ctx) error {
	deliverys := models.Deliveries{}

	customContext, cancel := context.WithCancel(context.Background())
	defer cancel()

	if err := c.BodyParser(deliverys); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"status":  "fail",
			"message": err.Error(),
		})
	}

	shipments, err := rc.repoService.SelectShippingCompany(customContext, deliverys)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"status":  "fail",
			"message": err.Error(),
		})
	}

	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"shipments": shipments,
	})
}
