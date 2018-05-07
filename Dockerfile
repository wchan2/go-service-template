FROM golang:1.10.2-alpine

ENV GOPATH /gopath
COPY . /gopath/src/project

WORKDIR /gopath/src/project

RUN go build -o main

ENTRYPOINT ["./main"]
