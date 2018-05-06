package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/sirupsen/logrus"
)

func main() {
	handler := func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		fmt.Fprint(w, "Hello World")
	}
	r := mux.NewRouter()
	r.Handle("/", http.HandlerFunc(handler))

	logrus.Fatal(http.ListenAndServe(":8080", r))
}
