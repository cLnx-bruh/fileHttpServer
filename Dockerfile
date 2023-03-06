# build
FROM golang:1.19-alpine AS builder
WORKDIR /build
RUN apk add build-base
COPY . .
RUN go build -o app src/server.go

# run
FROM alpine:3.17
COPY --from=builder /build .
EXPOSE 8085
ENTRYPOINT ["./app"]

# made with ❤️ on Docker UP!
