FROM golang:1.10.2-alpine as binary

ENV GOPATH /gopath
COPY . /gopath/src/project

WORKDIR /gopath/src/project

RUN go build -o main

CMD ["./main"]

FROM scratch as deploy

COPY --from=binary /gopath/src/project/main .

ENTRYPOINT ["./main"]
