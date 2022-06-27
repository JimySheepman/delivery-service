package models

import (
	"time"
)

type Deliveries struct {
	Deliveries []Delivery `json:"deliveries"`
}

type Delivery struct {
	Id        int64     `json:"deliveryId"`
	Status    string    `json:"status"`
	CreatedAt time.Time `json:"createAt"`
	UpdateAt  time.Time `json:"updateAt"`
	Packages  []Package `json:"packages"`
}

type Package struct {
	Id               int64   `json:"packageId"`
	VolumetricWeight float64 `json:"volumetricWeight"`
}
