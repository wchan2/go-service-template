# go-service-template

A template for a Go web service.

## Dependencies

- [dep](https://github.com/golang/dep) for dependency management
- [Gorilla Mux](https://github.com/gorilla/mux) for building the web service

## Installing the dependencies

```
go get -u github.com/golang/dep/cmd/dep
dep ensure
```

## Building the container

```
docker build -t svc-tpl .
docker run scv-tpl
```
