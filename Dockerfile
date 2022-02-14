FROM openshift/golang:1.14.7-ubi8
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app
EXPOSE 8080
RUN go get gopkg.in/DataDog/dd-trace-go.v1/contrib/net/http
RUN go build
CMD ["./app"]