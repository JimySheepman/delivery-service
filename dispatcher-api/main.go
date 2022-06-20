package main

import (
	"dispatcher-api/configs"
	"dispatcher-api/middleware"
	"dispatcher-api/models"
	"dispatcher-api/repository/postgre"
	"dispatcher-api/utils"

	"github.com/gofiber/fiber/v2"
)

func main() {
	// All configs
	err := configs.ConfigLoad("./.env")
	utils.IsFatalError(err)

	config := configs.AppConfig()

	//TODO: db conncetion
	dns := models.PostgreConnectionDTO{}
	dns = dns.New()
	pg, err := postgre.Connection(dns)
	utils.IsFatalError(err)
	repo := postgre.NewPostgreRepository(pg)
	repo.Ping(pg)

	app := fiber.New(config)

	middleware.Middlewares(app)

	//TODO: create object infra - service - handler

	utils.GracefulShutdown(app)
}
