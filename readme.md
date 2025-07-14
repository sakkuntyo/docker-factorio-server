ブランチでfactorioバージョンを分けてます。

バニラではそのまま接続できないので、Entrypoint.sh には mods-list.json を置き換える工程が含まれます。

docker のマウントで /root/factoriodata/mysave.zip が配置される様に RUN すると、既存のワールドデータを利用できます。
