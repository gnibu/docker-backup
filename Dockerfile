FROM ubuntu:14.04

# Install python dependancies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    openssh-server \
    rsync &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /root/entrypoint.sh
COPY sshd_config /etc/ssh/sshd_config
RUN echo fr_FR.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen
RUN locale-gen fr_FR.UTF-8 && update-locale LANG=fr_FR.UTF-8 
CMD ["/bin/bash", "-c", "/root/entrypoint.sh" ]

EXPOSE 22
