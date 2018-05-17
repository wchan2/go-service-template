# go-service-template

A template for a Go web service. Its built with the following concepts:

- Using multi-stage builds for small minimal images for deployment
- docker-compose to manage external service dependencies such as databases for development

## Dependencies

- [dep](https://github.com/golang/dep) for dependency management
- [Gorilla Mux](https://github.com/gorilla/mux) for building the web service

## Installing the dependencies

```
go get -u github.com/golang/dep/cmd/dep
dep ensure
```

## Building the binary

Build the binary for development purposes

```
docker build --target binary binary .   # builds the image with the binary inside
docker run binary                       # runs the service in the container
```

## Building the deploy image

Build a minimal image that runs the Go binary

```
docker build --target deploy -t deployment . # builds a the minimal image with the binary
docker run deployment                        # runs the service in the container
```
