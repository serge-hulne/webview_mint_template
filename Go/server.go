package main

import (
	"embed"
	"fmt"
	"io/fs"
	"log"
	"net/http"
)

var Port = "3000"
var Url = "http://127.0.0.1:" + Port

//go:embed Mint/dist/*
var content embed.FS

func run_server() {

	fmt.Printf("URL: %s\n", Url)

	// Sub-directory within the embedded file system
	subDirFS, err := fs.Sub(content, "Mint/dist")
	if err != nil {
		log.Fatalf("failed to locate embedded subdirectory: %v", err)
	}

	// 1) Create a new HTTP file system for the embedded files.
	// 2) Serve the files under the "Mint/dist" directory as if they were at the root.
	http.Handle("/", http.FileServer(http.FS(subDirFS)))

	fmt.Printf("Port: %s\n", Port)
	err = http.ListenAndServe(":"+Port, nil)
	if err != nil {
		fmt.Println(err)
	}
}
