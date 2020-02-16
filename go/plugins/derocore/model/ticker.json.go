package model

import "encoding/json"

type Ticker struct {
	Success bool `json:"success"`
	PriceUSD float64 `json:"price_usd"`
	PriceBTC float64 `json:"price_btc"`
}

func (t *Ticker) Marshal() (string, error) {
	d, e := json.Marshal(t)
	if e != nil {
		return "", e
	}
	return string(d), nil
}