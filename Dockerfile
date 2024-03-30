FROM golang:1.21 as builder

WORKDIR /

COPY . .

RUN go build .

RUN chmod +x migratecheckpoint

FROM scratch

COPY --from=builder /migratecheckpoint /migratecheckpoint

ENTRYPOINT ["/migratecheckpoint"]