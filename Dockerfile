FROM cloudposse/packages:0.2.1 as packages
FROM nginx:1.15.0-alpine

ENV HOMEPAGE=https://bit.ly/3xkarmR
ENV EMAIL=hello@imnorobot.com

COPY --from=packages /packages/bin/gomplate /usr/bin/

ADD rootfs/ /

CMD ["gomplate", "--input-dir", "/usr/share/nginx/html/", "--output-dir", "/usr/share/nginx/html/", "--", "nginx", "-g", "daemon off;"]
