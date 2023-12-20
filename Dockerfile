FROM golang:1.20-bullseye AS go-builder

# Set Golang environment variables.
ENV GOPATH=/go
ENV PATH=$PATH:/go/bin

# Install dependencies
ENV PACKAGES git make gcc musl-dev wget ca-certificates
RUN apt-get update
RUN apt-get install -y $PACKAGES

# Update ca certs
RUN update-ca-certificates

ARG VERSION=v11.0.0

RUN git clone https://github.com/zeta-chain/node.git \
    && cd node \
    && git checkout tags/$VERSION \
    && make install \
    && make build

RUN mkdir -p /root/.zetacored/bin
RUN mkdir /root/.zetacored/config
RUN mkdir /root/.tss

WORKDIR /root/.zetacored/bin

# Final image
FROM ubuntu:jammy

# Install ca-certificates
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y ca-certificates curl wget jq \
    && apt-get -y purge && apt-get -y clean

COPY --from=go-builder /go/bin/zetacored /usr/bin/zetacored

# Run the binary.
CMD ["/bin/sh"]

COPY . .

ENV SHELL /bin/bash
