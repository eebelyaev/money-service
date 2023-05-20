FROM golang:1.20.4-alpine as build
WORKDIR /app/
COPY . .
RUN go build -o money-service ./cmd/money-service/

FROM alpine:3.18.0
WORKDIR /app/
COPY --from=build ./app/money-service .
CMD ["./money-service"]