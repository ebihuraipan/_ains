### 最低限はこれだけ

```shell
# システムのアップデート
sudo pacman -Syu


#ミラーの最適化
sudo pacman -g


#レポジトリのソフトウェアの検索
pacman -Ss ■■■


#インストール
sudo pacman -S ■■■

#インストール済みパッケージ
pacman -Q

#パッケージの削除
sudo pacman -R ■■■


#pacman.confの表示
cat /etc/pacman.conf

```