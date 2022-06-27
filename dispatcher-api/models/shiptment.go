package models

type Shipment struct {
	TrackingId int64  `json:"tracking_id"`
	Company    string `json:"company"`
}
