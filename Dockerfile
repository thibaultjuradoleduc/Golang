FROM golang:1.11
RUN git config --global http.sslVerify false
#RUN go get gopkg.in/DataDog/dd-trace-go.v1/...
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app
EXPOSE 8080
RUN go build
CMD ["./app"]