package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		host, _ := os.Hostname()
		fmt.Fprintf(w, "Hello K8s! 来自节点: %s\n", host)
	})
	fmt.Println("Server running on :8080")
	http.ListenAndServe(":8080", nil)
}