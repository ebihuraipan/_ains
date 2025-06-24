#!/usr/bin/perl
use strict;
use warnings;
require './pl/_sub.pl';


# 入力ファイルの内容を読み込む
my @lines = Sub::rfile("./bk/httpd.conf");


# 66行目付近、編集
@lines = Sub::edit_text(\@lines,
    "LoadModule mpm_event_module modules/mod_mpm_event.so",
    "#LoadModule mpm_event_module modules/mod_mpm_event.so"
);


# 67行目付近、編集
@lines = Sub::edit_text(\@lines,
    "#LoadModule mpm_prefork_module modules/mod_mpm_prefork.so",
    "LoadModule mpm_prefork_module modules/mod_mpm_prefork.so"
);


# 190行目付近、追記
@lines = Sub::add_text_bottom(\@lines,
    "#LoadModule rewrite_module modules/mod_rewrite.so",
    "\n".
    "LoadModule php_module modules/libphp.so\n".
    "AddType application/x-httpd-php .php\n".
    #"<FilesMatch \\.php$>\n".
    #"    SetHandler application/x-httpd-php\n".
    #"</FilesMatch>\n"
    "\n"
);


# 530行目付近、最後らへん、追記
@lines = Sub::add_text_top(\@lines,
    "# Secure (SSL/TLS) connections",
    "\n".
    "Include conf/extra/php_module.conf\n".
    "\n"
);


# 出力ファイルに書き込み
my ($sec,$min,$hour,$mday,$mon,$year) = localtime;
my $timestamp = sprintf("%04d%02d%02d_%02d%02d%02d", $year + 1900, $mon + 1, $mday, $hour, $min, $sec);
my $output_file = "./bk/httpd.conf_$timestamp";
Sub::wfile($output_file, @lines);


exit;
