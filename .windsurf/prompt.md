# プロジェクト名: _ains_

## プロジェクト概要
- 目的: 自分用のArch Linuxの再インストール手順と設定を自動化・文書化
- 目標: 
  - インストール手順の標準化
  - 手動設定の最小化
  - 設定の再現性の"ある程度"の確保


## 基本方針
- このプロジェクトは自分用のArch Linux再インストール時のドキュメントとスクリプト
  - 再インストール時はフルインストールするかミニマムインストールするかわからないので、スクリプトはどちらの方法でも対応できるようにする
    - そのやり方としてスクリプトは機能ごとのスクリプト分割を採用する
- 再インストール処理は可能な限りshellで書く、次にperlを使う
- その他GUIアプリの設定など、スクリプトで行えない部分もあるので、それらは手動で行う
  - それらもなるべくここでドキュメント化してまとめる
- スクリプトを実行するタイミングで、各項目のアップデートや仕様変更によりインストール手順や設定項目が変わっている可能性があるため、スクリプトは根本的に叩いてみないとわからない
  - そのため、このプロジェクト内でテストやデバッグやエラーハンドリングは不要
  - スクリプトが失敗した場合、別PCでここで管理しているドキュメントとスクリプトを使ってミニマムインストールして調査を行う、そして再度スクリプトを修正して叩く
    - これがこのプロジェクトとしての開発サイクルとなる


## 開発環境
- 主要言語: shell, perl
- フレームワーク: archinstall
- ビルドツール: make


## 技術スタック
- 実行環境
  - arch linux
- 実行スクリプト
  - shell
  - perl
  - archinstall
- エディタ
  - vscode
  - windsurf


## スクリプトの命名規約
- shellスクリプトは.shで終わる
- perlスクリプトは.plで終わる
- なるべく短縮する、例えばcopyをcpとするようにする

## セキュリティ要件
- パスワードや認証情報は.envファイルで管理する
- ホームディレクトリのユーザー名などセンシティブな情報は公開しない

## コーディング規約
- shellでホームディレクトリパスを取得する方法は、以下のいずれかを使用する
  - シェル内でベタ書きで~を使う


### ファイル構造
- 未定、今後複雑なものが来るかもしれないので明記しない


## テスト環境
- テスト環境は基本的に不要

## デバッグ
- デバッグは基本的に不要

## エラーハンドリング
- エラー発生時の対応は不要