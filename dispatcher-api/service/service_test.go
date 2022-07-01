package service

import (
	"testing"

	"dispatcher-api/mocks"
)

func TestSelectShippingCompany(t *testing.T) {
	r := mocks.NewMockRepository()
	s := NewRepoSerivce(r)
	_ = s

	tests := []struct {
		testName string
	}{
		{testName: "test"},
	}

	for _, test := range tests {
		t.Run(test.testName, func(t *testing.T) {
			t.Log(test.testName)
		})
	}
}
