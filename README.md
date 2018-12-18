# go-service-template

A template for a Go web service. Its built with the following concepts:

- docker-compose to manage external service dependencies such as databases for development
- Using multi-stage builds for small minimal images for deployment
- `Makefile` to run tests, static analysis and build and deploy docker images

## Dependencies

- [dep](https://github.com/golang/dep) for dependency management
- [Gorilla Mux](https://github.com/gorilla/mux) for building the web service

## Installing the dependencies

```
go get -u github.com/golang/dep/cmd/dep
dep ensure
```

## The Development Environment

Setting up the local environment

```
export PROJECT_PATH=github.com/wchan2/go-service-temeplate # this should be where the project builds from
docker-compose up                                          # start up the webapp with hot reloading
docker-compose down                                        # tear down the service
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

## Batteries Included

Includes the following batteries:

1. A `Makefile` that includes simple build targets for
    1. Running tests
    1. Running static analysis
    1. Building the image

## Using the Template

Download the template and *rename the import path in the go files to your project location relative to your gopath*.

```bash
wget https://github.com/wchan2/go-service-template/archive/master.zip && unzip master.zip && mv go-service-template-master/* . && rm -rf go-service-template-master master.zip
```
