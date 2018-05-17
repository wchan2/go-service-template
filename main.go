package main

import (
	"flag"
	"fmt"
	"net/http"
	"net/http/pprof"

	"github.com/gorilla/mux"
	"github.com/sirupsen/logrus"
)

var (
	port string
)

func init() {
	flag.StringVar(&port, "port", "8080", "port for which to run the web service")
	flag.Parse()
}

func main() {
	r := mux.NewRouter()

	health := func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
	}
	r.HandleFunc("/health", health)
	r.HandleFunc("/health/pprof/heap", pprof.Index)
	r.HandleFunc("/health/pprof/profile", pprof.Profile)

	svcPort := fmt.Sprintf(":%s", port)
	logrus.Infof("Running service on port %s", svcPort)
	logrus.Fatal(http.ListenAndServe(svcPort, r))
}
