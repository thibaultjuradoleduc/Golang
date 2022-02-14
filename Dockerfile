FROM golang:1.11
RUN mkdir -p /go/src/app
# Get certificate from "github.com"
RUN openssl s_client -showcerts -connect github.com:443 </dev/null 2>/dev/null|openssl x509 -outform PEM > ${cert_location}/github.crt
# Get certificate from "proxy.golang.org"
RUN openssl s_client -showcerts -connect proxy.golang.org:443 </dev/null 2>/dev/null|openssl x509 -outform PEM >  ${cert_location}/proxy.golang.crt
# Update certificates
RUN update-ca-certificates
WORKDIR /go/src/app
COPY . /go/src/app
RUN go mod download
EXPOSE 8080
RUN go build
CMD ["./app"]