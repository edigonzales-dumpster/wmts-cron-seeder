FROM ubuntu:18.04
MAINTAINER Stefan Ziegler

# Install cron
RUN apt-get update && apt-get install -y cron mapcache-tools

# Create the pseudo log file to point to stdout
RUN ln -sf /proc/1/fd/1 /var/log/cron.log

RUN mkdir /mapcache /tiles && \
    chmod g+w /mapcache /tiles
COPY mapcache*.xml /mapcache/    
COPY wmts-seeding-perimeter.gpkg /mapcache/
RUN chmod --recursive g+w /mapcache

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
