FROM ubuntu:20.04

RUN apt update \
    && apt install -y --no-install-recommends mysql-client \
    && rm -rf /var/lib/apt/lists/*

RUN apt -y update
RUN apt -y install openssh-client git wget

RUN ["wget", "-qO/tmp/install-nvm.sh", "https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh"]
RUN ["bash", "/tmp/install-nvm.sh"]
COPY install-node.sh /install-node.sh
RUN ["chmod", "+x", "/install-node.sh"]
RUN ["bash", "/install-node.sh"]

RUN ["mkdir", "-p", "/root/.ssh"]
RUN ["mkdir", "/app"]

ENTRYPOINT ["/bin/bash"]
