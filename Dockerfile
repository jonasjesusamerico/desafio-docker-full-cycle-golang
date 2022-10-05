FROM golang:stretch as basic-golang

WORKDIR /app/

COPY ./main.go /app

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=basic-golang /app/main /app

CMD [ "./main" ]