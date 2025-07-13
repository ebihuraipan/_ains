


# インストール手順

1. パーティションの確認
```bash
fdisk -l
```

2. パーティションのマウント
```bash
# root パーティション
mount /dev/sdx /mnt
```

3. archinstallの実行
```bash
archinstall --config /mnt/conf.json --creds /mnt/creds.json
```



