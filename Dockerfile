FROM nginxdemos/hello:0.4-plain-text

# custom-nginx.conf を上書きして、/tmp に temp パスを変更
COPY custom-nginx.conf /etc/nginx/nginx.conf

# 非rootユーザーで実行（restricted SCC 対応）
USER 1001
