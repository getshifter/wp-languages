FROM debian:11-slim
ARG WP_VERSION="6.5"

RUN apt-get update && apt-get install -y unzip jq wget curl
RUN mkdir -p /srv/languages
COPY extract_language.sh /tmp/extract_language.sh
RUN /tmp/extract_language.sh
