package main

import (
	"dispatcher-api/configs"
	"dispatcher-api/middleware"
	"dispatcher-api/utils"

	"github.com/gofiber/fiber/v2"
)

func main() {
	err := configs.ConfigLoad()
	utils.IsFatalError(err)

	config := configs.AppConfig()

	//TODO: db conncetion

	app := fiber.New(config)

	middleware.Middlewares(app)

	//TODO: create object infra - service - handler

	utils.GracefulShutdown(app)
}
