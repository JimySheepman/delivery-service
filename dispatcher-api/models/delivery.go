package models

import (
	"time"
)

type Deliverys struct {
	Deliverys []Delivery
}

type Delivery struct {
	Id        int64
	Status    string
	CreatedAt time.Time
	Packets   []Packet
}

type Packet struct {
	Id               int64
	VolumetricWeight float64
}
