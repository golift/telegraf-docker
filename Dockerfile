FROM telegraf:1.28@sha256:8aff5a74822413552542a43adbcfb519cba234b16def8a1903f0ae4521a71071

RUN apt update && apt install -y --no-install-recommends \
       sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
        rm -rf /var/lib/apt/lists/* && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
        echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

