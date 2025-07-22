FROM nginxdemos/hello:0.4-plain-text

# NGINX用キャッシュディレクトリを別に作成
RUN mkdir -p /tmp/nginx && chmod -R 777 /tmp/nginx

# NGINX設定を上書きする例（任意）
# COPY custom-nginx.conf /etc/nginx/nginx.conf

# SCC restricted で動かせるよう非rootにする
USER 1001

ENV NGINX_TEMP_PATH=/tmp/nginx
