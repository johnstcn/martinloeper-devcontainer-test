FROM scratch

WORKDIR /app

ADD build build

ENTRYPOINT [ "/app/build/backend" ]