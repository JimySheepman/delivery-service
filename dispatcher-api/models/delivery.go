package models

type Deliveries struct {
	Deliveries []Delivery `json:"deliveries"`
}

type Delivery struct {
	Id       int64     `json:"deliveryId"`
	City     string    `json:"city"`
	District string    `json:"district"`
	Packages []Package `json:"packages"`
}

type Package struct {
	Id               int64   `json:"packageId"`
	VolumetricWeight float64 `json:"volumetricWeight"`
}
