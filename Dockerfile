FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip && curl -fsSL -o /tmp/x.zip https://github.com/XTLS/Xray-core/releases/download/v26.10.31/Xray-linux-64.zip && unzip /tmp/x.zip xray geoip.dat geosite.dat -d /usr/local/bin && rm /tmp/x.zip
EXPOSE 10000
CMD ["sh", "-c", "echo \"$XRAY_CONFIG\" > /tmp/c.json && exec /usr/local/bin/xray run -c /tmp/c.json"]
