FROM nginxdemos/hello:0.4-plain-text

# 非rootユーザーでも動作できるよう必要なディレクトリを準備
RUN mkdir -p /var/cache/nginx/client_temp /tmp && \
    chmod -R 777 /var/cache/nginx /tmp

# nginx設定を上書き
COPY custom-nginx.conf /etc/nginx/nginx.conf

# OpenShiftのrestricted SCC対応（USER指定）
USER 1001

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
