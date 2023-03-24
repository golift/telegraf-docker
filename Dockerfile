FROM telegraf:1.26@sha256:1cbb11a36a2b3f922b715560f872533facd59fd9b6070e833a87ae3d9a452302

RUN apt update && apt install -y --no-install-recommends \
       sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
        rm -rf /var/lib/apt/lists/* && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
        echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

