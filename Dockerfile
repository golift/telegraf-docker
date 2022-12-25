FROM telegraf:latest

RUN apt update && apt install -y --no-install-recommends \
        mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
        rm -rf /var/lib/apt/lists/*
