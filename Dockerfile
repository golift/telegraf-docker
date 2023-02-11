FROM telegraf:1.25@sha256:46ce98720a16d194fd1150d45c4046b0c3b077ac2f25feb79288ae718c4ba68d

RUN apt update && apt install -y --no-install-recommends \
       sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
        rm -rf /var/lib/apt/lists/* && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
        echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

