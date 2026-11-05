FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip && curl -fsSL -o /tmp/x.zip https://github.com/XTLS/Xray-core/releases/download/v26.10.31/Xray-linux-64.zip && unzip /tmp/x.zip xray geoip.dat geosite.dat -d /usr/local/bin && rm /tmp/x.zip
EXPOSE 8080
CMD echo "$XRAY_CONFIG" | sed "s/__PORT__/${PORT:-8080}/" | /usr/local/bin/xray run -c stdin:
