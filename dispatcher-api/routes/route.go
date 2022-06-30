package routes

import (
	"dispatcher-api/controllers"
	"dispatcher-api/service"

	"github.com/gofiber/fiber/v2"
)

func Routes(app *fiber.App, repo service.RepoService) {
	route := app.Group("/api/v1")
	controller := controllers.NewController(repo)

	route.Get("/healthcheck", controller.Healthcheck)
	route.Post("/shipping", controller.SelectShippingCompany)
}
