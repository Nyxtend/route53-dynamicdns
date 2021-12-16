FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get upgrade -qqy && \
  DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    awscli \
    build-essential \
    ca-certificates \
    curl \
    dnsutils \
    jq \
    pkg-config \
    sudo \
    tar \
    wget

# Add startup script
WORKDIR /work
ADD docker-init.sh .

RUN chmod +x docker-init.sh
CMD ["/work/docker-init.sh"]
