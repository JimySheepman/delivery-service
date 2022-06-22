package routes

import (
	"net/http/httptest"
	"testing"

	"github.com/gofiber/fiber/v2"
	"github.com/stretchr/testify/assert"
)

func TestRoutes(t *testing.T) {

	app := fiber.New()
	Routes(app)

	tests := []struct {
		description   string
		route         string
		expectedError bool
		expectedCode  int
	}{
		{
			description:   "test should be not accepted all routes",
			route:         "/",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted all routes",
			route:         "/api/v1",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be not accepted all routes",
			route:         "/api/v1/test",
			expectedError: false,
			expectedCode:  404,
		},
		{
			description:   "test should be accepted routes",
			route:         "/api/v1/healthcheck",
			expectedError: false,
			expectedCode:  200,
		},
	}

	for _, test := range tests {
		req := httptest.NewRequest("GET", test.route, nil)
		req.Header.Set("Content-Type", "application/json")
		resp, err := app.Test(req, -1)
		assert.Equalf(t, test.expectedError, err != nil, test.description)
		if test.expectedError {
			continue
		}
		assert.Equalf(t, test.expectedCode, resp.StatusCode, test.description)
	}
}
