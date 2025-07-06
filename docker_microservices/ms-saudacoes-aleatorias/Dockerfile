# before - FROM golang:1.24-alpine AS builder
FROM cgr.dev/chainguard/go AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=1 GOOS=linux go build \
    -trimpath -ldflags="-s -w" \
    -o main .

# Estágio final
# before - FROM alpine:latest
FROM cgr.dev/chainguard/glibc-dynamic
WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8080
ENTRYPOINT ["./main"]