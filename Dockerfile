FROM alpine:latest
EXPOSE 8080
WORKDIR /app

ENV WEB_USERNAME=admin
ENV WEB_PASSWORD=admin*2023*
ENV ARGO_AUTH=eyJhIjoiYWQ1NDUwYTgyNTI0M2VhZTE5Y2E0ODI4MWQxNTRiZjIiLCJ0IjoiMDY2NTU2MjAtYWE0NS00YTAwLWIwYjMtMTAzYzg1NWZlNWVhIiwicyI6Ik5EVTVZMkUxTW1RdE5qUm1PUzAwWmpNM0xUazJOamN0TW1JeE5tTmxZVEEwTmpBeCJ9
ENV UUID=0e059fce-d6c8-4cc2-9e11-9efff358f8b9
ENV PORT=8080

RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip wget bash
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
RUN mv cloudflared-linux-amd64 cloudflared
RUN chmod +x cloudflared
RUN wget https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64
RUN mv ttyd.x86_64 ttyd
RUN chmod +x ttyd

COPY configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD bash /configure.sh