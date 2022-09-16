FROM alpine:edge

ARG AUUID="7de8bfb2-9bd1-4242-9721-ff1a33be1e72"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page276/ocean-vibes.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
