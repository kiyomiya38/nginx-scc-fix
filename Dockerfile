FROM nginxdemos/hello:0.4-plain-text

# 非rootでも起動できるように一時ディレクトリ作成とパーミッション変更
RUN mkdir -p /var/cache/nginx/client_temp && chmod -R 777 /var/cache/nginx

# 独自の nginx 設定ファイルをコピー（8080番ポートに変更）
COPY custom-nginx.conf /etc/nginx/nginx.conf

# nginxは非rootで実行
USER 1001

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
