FROM ubuntu:14.04

# Install python dependancies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    openssh-server \
    rsync &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# launch the stuff
COPY entrypoint.sh /root/entrypoint.sh
COPY sshd_config /etc/ssh/sshd_config
CMD ["/bin/bash", "-c", "/root/entrypoint.sh" ]

EXPOSE 22
