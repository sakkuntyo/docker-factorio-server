FROM "steamcmd/steamcmd:ubuntu-24"

COPY entrypoint.sh /entrypoint.sh

# サーバー実行
ENTRYPOINT ["entrypoint.sh"]
CMD ""
