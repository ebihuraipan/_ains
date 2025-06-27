#!/bin/bash

# MySQLのインストールと設定スクリプト

# MySQLサーバーのインストール
sudo pacman -S mysql --noconfirm


# MySQLの初期設定
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql


# MySQLサービス
sudo systemctl start mysqld
sudo systemctl enable mysqld


# MySQLのバージョン確認
echo "MySQLのバージョンを確認します:"
mysql --version


# MySQLのログイン方法を表示
echo "MySQLにログインするには以下のコマンドを使用してください:"
echo "mysql -u root -p"


# テストデータベースとテーブルの作成
echo "テストデータベースとテーブルを作成します..."
sudo mysql -e "
CREATE DATABASE IF NOT EXISTS db;
USE db;

-- テスト用テーブルの作成
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 投稿テーブルの作成
CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- テストデータの挿入
INSERT INTO users (name, email) VALUES
('田中太郎', 'tanaka@example.com'),
('鈴木花子', 'suzuki@example.com'),
('山田一郎', 'yamada@example.com'),
('佐藤美咲', 'satou@example.com'),
('高橋健太', 'takahashi@example.com'),
('中村真由美', 'nakamura@example.com'),
('木村大輔', 'kimura@example.com'),
('加藤美香', 'kato@example.com'),
('伊藤健太郎', 'ito@example.com'),
('小林菜々子', 'kobayashi@example.com');

-- 投稿データの挿入
INSERT INTO posts (user_id, content) VALUES
(1, '新しいプロジェクトを始動しました！'),
(3, 'Pythonの新しいライブラリを見つけました'),
(5, '新しい本を読み始めました'),
(2, '今日のランチは美味しいカフェで過ごしました'),
(4, '週末の旅行計画を立てています'),
(6, '今日の運動はジョギングでした'),
(1, 'プロジェクトの進捗を確認しました'),
(3, 'Pythonのコードをリファクタリングしました'),
(4, '旅行の準備を進めています'),
(2, '新しいカフェを見つけました'),
(5, '本の感想をまとめました'),
(6, '運動の記録を更新しました'),
(7, '勉強会の資料を作成しました'),
(8, '音楽のプレイリストを作成しました'),
(9, '料理の写真を撮りました');

-- ユーザーごとの投稿を確認
SELECT u.name, p.content, p.created_at 
FROM users u 
JOIN posts p ON u.id = p.user_id 
ORDER BY p.created_at DESC;"

# テストデータベースの確認方法を表示
echo "テストデータベースを確認するには以下のコマンドを使用してください:"
echo "mysql -u root -p db"

echo "データベースとテーブルの作成が完了しました。"

