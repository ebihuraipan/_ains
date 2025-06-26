# iwctlコマンド



### 最低限はこれだけ

```shell
# 起動
iwctl

# wifi接続
station <device> connect "<SSID>"
```



## 基本コマンド

### デバイスの確認
```bash
# 起動
iwctl

# デバイス一覧表示
device list

# 無線デバイスの確認
device list

# 特定のデバイスの状態確認
station <device> show
```

### WiFiスキャン
```bash
# WiFiネットワークのスキャン
station <device> scan

# スキャン結果の表示
station <device> get-networks
```

### WiFi接続
```bash
# WiFiネットワークに接続
station <device> connect "<SSID>"

# パスワード入力が必要な場合
station <device> connect "<SSID>" password "<password>"
```

### 状態の確認
```bash
# 接続状態の確認
station <device> show

# IPアドレスの確認
ip addr show <device>
```

### 切断
```bash
# WiFiの切断
station <device> disconnect
```

### 終了
```bash
CTRL + C
```

