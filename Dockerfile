FROM nginxdemos/hello:0.4-plain-text

# nginx キャッシュ用ディレクトリを作成し、全ユーザー書き込み可能にする
RUN mkdir -p /var/cache/nginx/client_temp && \
    chmod -R 777 /var/cache/nginx

# 非rootユーザーで実行（OpenShift restricted SCC に対応）
USER 1001
