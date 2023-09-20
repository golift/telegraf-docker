FROM telegraf:1.28@sha256:a20491ea9007684ac53f7696570b90d2519c0629e1ceffa543d2e2eb6ca4bae9

RUN apt update && apt install -y --no-install-recommends \
       sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
        rm -rf /var/lib/apt/lists/* && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
        echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

