package routes

import (
	"dispatcher-api/mocks"
	"dispatcher-api/service"
	"net/http/httptest"
	"testing"

	"github.com/gofiber/fiber/v2"
	"github.com/stretchr/testify/assert"
)

func TestRoutes(t *testing.T) {

	app := fiber.New()
	r := mocks.NewMockRepository()
	service := service.NewRepoSerivce(r)
	Routes(app, service)

	tests := []struct {
		description   string
		route         string
		method        string
		expectedError bool
		expectedCode  int
	}{
		{
			description:   "test should be not accepted GET method",
			route:         "/",
			method:        "GET",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted POST method",
			route:         "/",
			method:        "POST",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted PUT method",
			route:         "/",
			method:        "PUT",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted PATCH method",
			route:         "/",
			method:        "PATCH",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted DELETE method",
			route:         "/",
			method:        "DELETE",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted GET method",
			route:         "/api/v1",
			method:        "GET",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted POST method",
			route:         "/api/v1",
			method:        "POST",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted PUT method",
			route:         "/api/v1",
			method:        "PUT",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted PATCH method",
			route:         "/api/v1",
			method:        "PATCH",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted DELETE method",
			route:         "/api/v1",
			method:        "DELETE",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be accepted routes and GET method",
			route:         "/api/v1/healthcheck",
			method:        "GET",
			expectedError: false,
			expectedCode:  200,
		},
		{
			description:   "test should be not accepted healthcheck routes and POST method",
			route:         "/api/v1/healthcheck",
			method:        "POST",
			expectedError: false,
			expectedCode:  405,
		},
		{
			description:   "test should be not accepted healthcheck routes and PUT method",
			route:         "/api/v1/healthcheck",
			method:        "PUT",
			expectedError: false,
			expectedCode:  405,
		},
		{
			description:   "test should be not accepted healthcheck routes and PATCH method",
			route:         "/api/v1/healthcheck",
			method:        "PATCH",
			expectedError: false,
			expectedCode:  405,
		},
		{
			description:   "test should be not accepted healthcheck routes and DELETE method",
			route:         "/api/v1/healthcheck",
			method:        "DELETE",
			expectedError: false,
			expectedCode:  405,
		},
		{
			description:   "test should be accepted shipping routes and non-body POST method",
			route:         "/api/v1/shipping",
			method:        "POST",
			expectedError: false,
			expectedCode:  400,
		},
		{
			description:   "test should be not accepted shipping routes and GET method",
			route:         "/api/v1/shipping",
			method:        "GET",
			expectedError: false,
			expectedCode:  405,
		},
		{
			description:   "test should be not accepted shipping routes and PUT method",
			route:         "/api/v1/shipping",
			method:        "PUT",
			expectedError: false,
			expectedCode:  405,
		},
		{
			description:   "test should be not accepted shipping routes and PATCH method",
			route:         "/api/v1/shipping",
			method:        "PATCH",
			expectedError: false,
			expectedCode:  405,
		},
		{
			description:   "test should be not accepted shipping routes and DELETE method",
			route:         "/api/v1/shipping",
			method:        "DELETE",
			expectedError: false,
			expectedCode:  405,
		},
	}

	for _, test := range tests {
		t.Run(test.description, func(t *testing.T) {
			req := httptest.NewRequest(test.method, test.route, nil)
			req.Header.Set("Content-Type", "application/json")
			resp, err := app.Test(req, -1)
			assert.Equalf(t, test.expectedError, err != nil, test.description)
			assert.Equalf(t, test.expectedCode, resp.StatusCode, test.description)
		})
	}
}
