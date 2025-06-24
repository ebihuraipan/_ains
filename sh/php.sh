#!/bin/bash


# ApacheとPHPのインストール
sudo pacman -S apache php php-apache --noconfirm

# PHPモジュールのインストール
#echo "=== PHPモジュールのインストールを開始します ==="
# Laravelとmbstringに必要なモジュールをインストール
#sudo pacman -S \
#    php-gd \
#    php-intl \
#    php-mysqli \
#    php-pgsql \
#    php-xml \
#    php-zip \
#    php-mbstring \
#    php-curl \
#    php-json \
#    php-openssl \
#    php-tokenizer \
#    php-session \
#    php-dom \
#    php-simplexml \
#    php-ctype \
#    php-iconv \
#    php-fileinfo \
#    php-pdo \
#    php-bcmath \
#    php-gmp \
#    php-imagick \
#    php-redis \
#    php-memcached \
#    php-sodium \
#    php-imagick \
#    php-xmlrpc \
#    php-soap \
#    php-bz2 \
#    php-zip --noconfirm

# Apacheの設定ファイルをバックアップ
sudo cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak


# PHPの設定ファイルをバックアップ
sudo cp /etc/php/php.ini /etc/php/php.ini.bak


# PHPの設定を最適化
perl http_conf.pl

# Apacheの起動と自動起動の設定
sudo systemctl start httpd
sudo systemctl enable httpd


# ディレクトリのパーミッション設定
sudo chmod 755 /srv/http
sudo chown -R http:http /srv/http


# テスト用のPHPファイルを作成
echo "<?php phpinfo(); ?>" | sudo tee /srv/http/info.php > /dev/null


# 確認メッセージ
echo "- Apache設定: /etc/httpd/conf/httpd.conf"
echo "- PHP設定: /etc/php/php.ini"


# Composerのインストール
sudo pacman -S composer


# Laravelのグローバルインストール
composer global require laravel/installer
echo "export PATH="~/.config/composer/vendor/bin:$PATH"" >> ~/.bashrc
laravel --version
