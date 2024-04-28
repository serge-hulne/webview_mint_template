package main

import (
	"log"
	"time"

	webview "github.com/webview/webview_go"
)

func main() {

	go func() {
		run_server()
	}()

	duration := time.Second / 3.0
	time.Sleep(duration)

	w := webview.New(true) // New(true) : for debugging.
	defer w.Destroy()
	w.SetTitle("Test app")
	w.SetSize(500, 800, webview.HintNone)

	err := w.Bind("increment", increment)
	Check(err)

	err = w.Bind("logGo", func(message string) {
		log.Println("Log from JS:", message)
	})
	Check(err)

	w.Navigate(Url)
	w.Run()
}
