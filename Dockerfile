FROM golang:1.11
RUN git config --global http.sslVerify false
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app
EXPOSE 8080
RUN go mod init gopkg.in/DataDog/dd-trace-go
RUN go get -u gopkg.in/DataDog/dd-trace-go.v1/ddtrace/tracer
RUN go get -u gopkg.in/DataDog/dd-trace-go.v1/profiler
RUN go get -u github.com/gin-gonic/gin
RUN go build
CMD ["./app"]