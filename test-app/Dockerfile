FROM golang:1.12.1-alpine AS builder

WORKDIR /app
COPY . /app

RUN CGO_ENABLED=0 go build

FROM alpine

COPY --from=builder /app/test-app /test-app

CMD ["/test-app"]
