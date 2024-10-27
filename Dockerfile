FROM alpine AS deps

RUN apk add --no-cache git make bash curl go && \
    go install github.com/go-delve/delve/cmd/dlv@latest

FROM alpine

RUN apk add --no-cache go
COPY --from=deps /root/go/bin /root/go/bin

WORKDIR /app
ADD build build
ADD helpers helpers

ENTRYPOINT [ "/app/build/backend" ]