FROM golang:1-alpine

# Add bash for a better DX
RUN apk add --no-cache bash

WORKDIR /app

COPY . .

RUN go mod download

RUN go install github.com/cosmtrek/air@latest

EXPOSE 3000

RUN air init

CMD ["air"]
