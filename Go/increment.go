package main

import "encoding/json"

type IncrementArgs struct {
	AddValue   uint `json:"addValue"`
	Multiplier uint `json:"multiplier"`
}

type IncrementResult struct {
	Count uint `json:"count"`
}

var count uint = 0

func increment(args json.RawMessage) IncrementResult {
	var incArgs IncrementArgs
	json.Unmarshal(args, &incArgs)
	count += incArgs.AddValue
	count *= incArgs.Multiplier
	return IncrementResult{Count: count}
}
