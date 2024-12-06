FROM golang:1.22.0

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

COPY tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /sprint12

CMD ["/sprint12"]