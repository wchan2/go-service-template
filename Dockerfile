FROM golang:1.11.2-alpine as development

ENV GOPATH /gopath
VOLUME /gopath/src/project

WORKDIR /gopath/src/project
RUN apk update && \
    apk upgrade && \
    apk add git && \
    go get -v -u github.com/golang/dep/cmd/dep && \
    go get -v -u github.com/cespare/reflex

CMD $GOPATH/bin/reflex -r '\.go$' -s -- sh -c 'go build -o main && ./main'

FROM golang:1.11.2-alpine as binary

ENV GOPATH /gopath
COPY . /gopath/src/project

WORKDIR /gopath/src/project

RUN go build -o main

CMD ["./main"]

FROM scratch as deploy

COPY --from=binary /gopath/src/project/main .

ENTRYPOINT ["./main"]
