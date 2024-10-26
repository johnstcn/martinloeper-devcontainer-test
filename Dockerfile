FROM alpine

WORKDIR /app

ADD build build
ADD helpers helpers

ENTRYPOINT [ "/app/build/backend" ]