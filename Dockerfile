FROM ghcr.io/nyxtend/ubuntu-base:latest

# Install dependencies
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get upgrade -qqy && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    awscli && \
  rm -rf /var/lib/apt/lists/*

# Add startup script
WORKDIR /work
ADD docker-init.sh .

RUN chmod +x docker-init.sh
CMD ["/work/docker-init.sh"]
