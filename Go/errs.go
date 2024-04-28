package main

import "fmt"

func Check(err error) {
	if err != nil {
		fmt.Println(err)
	}
}
