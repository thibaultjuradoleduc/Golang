FROM golang:1go.11
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app
EXPOSE 8080
RUN go get gopkg.in/DataDog/dd-trace-go.v1/contrib/net/http
RUN go build
CMD ["./app"]