FROM ubuntu:20.04

ARG TARGETARCH
ARG PORT
COPY ./dist/${TARGETARCH}/ttyd /usr/bin/ttyd
RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

WORKDIR /root

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["ttyd","-p $PORT", "bash"]
