#!/bin/bash

# MySQLのインストール
if ! command -v mysql &> /dev/null; then
    echo "MySQLをインストールします..."
    sudo pacman -S mariadb --noconfirm
    echo "MySQLのインストールが完了しました！"
else
    echo "MySQLは既にインストールされています"
fi

# MySQLの初期設定
if [ ! -f "/var/lib/mysql/mysql.sock" ]; then
    echo "MySQLの初期設定を行います..."
    sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    sudo systemctl start mariadb
    sudo systemctl enable mariadb
    echo "MySQLの初期設定が完了しました！"
fi

# MySQLのセキュリティ設定
read -p "MySQLのrootパスワードを設定してください: " MYSQL_ROOT_PASSWORD

mysql -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# サンプルデータベースとユーザーの作成
read -p "サンプルデータベースを作成しますか？（y/n）: " CREATE_SAMPLE

if [ "$CREATE_SAMPLE" = "y" ] || [ "$CREATE_SAMPLE" = "Y" ]; then
    # サンプルデータベースの作成
    mysql -u root -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS sample_db;

# サンプルユーザーの作成
CREATE USER IF NOT EXISTS 'sample_user'@'localhost' IDENTIFIED BY 'sample_password';
GRANT ALL PRIVILEGES ON sample_db.* TO 'sample_user'@'localhost';
FLUSH PRIVILEGES;

# サンプルテーブルの作成
USE sample_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

# サンプルデータの挿入
INSERT INTO users (username, email) VALUES 
('user1', 'user1@example.com'),
('user2', 'user2@example.com'),
('user3', 'user3@example.com');

INSERT INTO posts (user_id, title, content) VALUES 
(1, 'First Post', 'This is the first post.'),
(1, 'Second Post', 'This is the second post.'),
(2, 'Third Post', 'This is the third post.');

SELECT 'サンプルデータベースとテーブルの作成が完了しました！' as message;
EOF
fi

# 確認メッセージ
echo "MySQLのインストールと設定が完了しました！"
echo "以下の情報でMySQLにアクセスできます："
echo "- ホスト: localhost"
echo "- ユーザー: root"
echo "- パスワード: $MYSQL_ROOT_PASSWORD"

if [ "$CREATE_SAMPLE" = "y" ] || [ "$CREATE_SAMPLE" = "Y" ]; then
    echo "- サンプルデータベース: sample_db"
    echo "- サンプルユーザー: sample_user"
    echo "- サンプルパスワード: sample_password"
fi

# MySQLのサービス状態の確認
echo "\nMySQLのサービス状態を確認します："
systemctl status mariadb --no-pager
