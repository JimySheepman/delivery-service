package main

import (
	"dispatcher-api/configs"
	"dispatcher-api/middleware"
	"dispatcher-api/models"
	"dispatcher-api/repository"
	"dispatcher-api/repository/postgre"
	"dispatcher-api/routes"
	"dispatcher-api/service"
	"dispatcher-api/utils"

	"github.com/gofiber/fiber/v2"
	_ "github.com/lib/pq"
)

func main() {
	// All configs
	err := configs.ConfigLoad("./.env")
	utils.IsFatalError(err)

	config := configs.AppConfig()

	app := fiber.New(config)

	middleware.Middlewares(app)

	dns := models.PostgreConnectionDTO{}
	dns = dns.New()
	pg, err := repository.Connection(dns)
	utils.IsFatalError(err)
	repo := postgre.NewPostgreRepository(pg)

	repoService := service.NewRepoSerivce(repo)

	//TODO: create object infra - service - handler

	routes.Routes(app, repoService)
	routes.NotFoundRoute(app)

	utils.GracefulShutdown(app)
}
