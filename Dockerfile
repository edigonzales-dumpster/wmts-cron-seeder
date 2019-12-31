FROM sogis/wmts-wmts:latest
MAINTAINER Stefan Ziegler

USER root

# Install cron
RUN apt-get update && apt-get install -y cron 

# Create the pseudo log file to point to stdout
RUN ln -sf /proc/1/fd/1 /var/log/cron.log

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh

HEALTHCHECK NONE
