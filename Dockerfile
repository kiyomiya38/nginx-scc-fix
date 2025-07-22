FROM nginxdemos/hello:0.4-plain-text

# client_temp用ディレクトリを作成し、書き込み可能に変更
RUN mkdir -p /var/cache/nginx/client_temp && chmod -R 777 /var/cache/nginx

# ポート80ではなく非特権ポート8080でバインドするよう設定変更
RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# 8080ポートを明示的に開放（OpenShiftが読むため）
EXPOSE 8080

# 必ず非rootユーザーで起動（OpenShiftのrestricted SCCに適合）
USER 1001

