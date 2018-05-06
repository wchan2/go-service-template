FROM golang:1.10.2-alpine

ENV GOPATH /gopath
ENV PATH ${PATH}:${GOPATH}/bin

COPY . /gopath/src/github.com/wchan2/go-service-template
WORKDIR /gopath/src/github.com/wchan2/go-service-template

RUN go build -o main

ENTRYPOINT ["./main"]
