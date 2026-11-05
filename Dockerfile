FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip caddy && curl -fsSL -o /tmp/x.zip https://github.com/XTLS/Xray-core/releases/download/v26.10.31/Xray-linux-64.zip && unzip /tmp/x.zip xray geoip.dat geosite.dat -d /usr/local/bin && rm /tmp/x.zip
COPY Caddyfile /etc/caddy/Caddyfile
ENV XDG_DATA_HOME=/tmp XDG_CONFIG_HOME=/tmp
EXPOSE 8080
CMD echo "$XRAY_CONFIG" | sed "s/__PORT__/10001/; s/0.0.0.0/127.0.0.1/" | /usr/local/bin/xray run -c stdin: & exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
