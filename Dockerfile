FROM golang:1.11.2-alpine as development

ARG PROJECT_PATH
ENV GOPATH /go
VOLUME /go/src/${PROJECT_PATH}

WORKDIR /gopath/src/${PROJECT_PATH}
RUN apk update && \
    apk upgrade && \
    apk add git && \
    apk add gcc && \
    apk add libc-dev && \
    go get -v -u github.com/golang/dep/cmd/dep && \
    go get -v -u github.com/cespare/reflex

CMD $GOPATH/bin/reflex -r '\.go$' -s -- sh -c 'go build -o main && ./main'

FROM golang:1.11.2-alpine as binary

ARG PROJECT_PATH
ENV GOPATH /go
COPY . /go/src/${PROJECT_PATH}

WORKDIR /go/src/${PROJECT_PATH}

RUN go build -o main

CMD ["./main"]

FROM scratch as deploy

ARG PROJECT_PATH
COPY --from=binary /go/src/${PROJECT_PATH}/main .

ENTRYPOINT ["./main"]
