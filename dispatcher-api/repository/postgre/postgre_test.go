package postgre

import (
	"database/sql"
	"dispatcher-api/models"
	"log"
	"testing"

	"github.com/DATA-DOG/go-sqlmock"
)

func NewMock() (*sql.DB, sqlmock.Sqlmock) {
	db, mock, err := sqlmock.New()
	if err != nil {
		log.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	return db, mock
}

func TestShouldOpenConnection(t *testing.T) {
	db, _ := NewMock()
	_ = NewPostgreRepository(db)
	dnsModel := models.PostgreConnectionDTO{}
	dnsModel = dnsModel.New()

	tests := []struct {
		testName string
		model    models.PostgreConnectionDTO
		expected error
	}{
		{
			"true connection strings",
			models.PostgreConnectionDTO{},
			nil,
		},
	}

	for _, test := range tests {
		t.Run(test.testName, func(t *testing.T) {
			_, actual := Connection(test.model)
			if actual != test.expected {
				t.Errorf("got:%v expect:%v", actual, test.expected)
			}
		})
	}
}
