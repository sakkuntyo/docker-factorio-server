FROM "steamcmd/steamcmd:ubuntu-24"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# サーバー実行
ENTRYPOINT ["/entrypoint.sh"]
CMD ""
