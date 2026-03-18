# Stage 1: Build
FROM node:23 AS builder

ARG HUGO_VERSION=0.151.0
ARG GO_VERSION=1.24.0

RUN apt-get update && \
    apt-get install -y ca-certificates openssl git curl wget build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install Hugo Extended
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then ARCH=arm64; else ARCH=amd64; fi && \
    wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${ARCH}.tar.gz && \
    tar xf hugo.tar.gz && \
    mv hugo /usr/bin/hugo && \
    rm hugo.tar.gz && \
    hugo version

# Install Go
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then ARCH=arm64; else ARCH=amd64; fi && \
    wget -O go.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-${ARCH}.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm go.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

RUN git --version && hugo version && go version

WORKDIR /src
COPY . .

RUN npm install && npm run build

# Stage 2: Serve
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80
