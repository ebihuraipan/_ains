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


# apache、PHPの設定
# cp ../tmpl/httpd.conf.sample /etc/httpd/conf/httpd.conf

# /etc/httpd/conf/httpd.conf の以下の行をコメントアウトしてください: 
sudo sed -i 's/LoadModule mpm_event_module/#LoadModule mpm_event_module/' /etc/httpd/conf/httpd.conf

# そして次の行をアンコメントしてください: 
sudo sed -i 's/#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/' /etc/httpd/conf/httpd.conf

# 次の行を LoadModule リストの LoadModule dir_module modules/mod_dir.so の後のどこかに記述:
sudo sed -i '/^#LoadModule rewrite_module.*$/a\\n\n# 次の行をLoadModuleリストのLoadModule dir_module modules/mod_dir.soの後のどこかに記述' /etc/httpd/conf/httpd.conf
sudo sed -i '/# 次の行を/a\LoadModule php_module modules/libphp.so' /etc/httpd/conf/httpd.conf
sudo sed -i '/LoadModule php_module modules/a\AddType application/x-httpd-php .php\n\n'  /etc/httpd/conf/httpd.conf

#次の行を Include リストの最後に記述:
sudo sed -i '/# Secure .* connections/i\# 次の行をIncludeリストの最後に記述\n\n'  /etc/httpd/conf/httpd.conf
sudo sed -i '/# 次の行をIncludeリストの最後に記述/a\Include conf/extra/php_module.conf'  /etc/httpd/conf/httpd.conf


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
