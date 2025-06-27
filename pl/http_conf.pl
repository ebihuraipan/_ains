#!/usr/bin/perl
use strict;
use warnings;
use POSIX qw(strftime);


##################################################サブルーチン
# ファイル読み込み
sub rfile {
    my ($file) = @_;
    open my $in, '<', $file or die "元のファイルを開けません: $!";
    my @lines = <$in>;
    close $in;
    return @lines;
}


# 上に追記
sub insert_text_top {
    my ($lines, $pattern, $text) = @_;    # 引数: 配列リファレンス、正規表現、追加テキスト
    my @lines = @$lines;
    
    for (my $i = 0; $i < @lines; $i++) {
        if ($lines[$i] =~ /$pattern/) {
            $lines[$i] = $text . "\n";
        }
        $lines[$i] = $lines[$i];
    }
    return @lines;
}

# 下に追記
sub insert_text_bottom {
    my ($lines, $pattern, $text) = @_;    # 引数: 配列リファレンス、正規表現、追加テキスト
    my @lines = @$lines;
    
    for (my $i = 0; $i < @lines; $i++) {
        $lines[$i] = $lines[$i];
        if ($lines[$i] =~ /$pattern/) {
            $lines[$i] = $text . "\n";
        }
    }
    return @lines;
}


# 編集
sub edit_text {
    my ($lines, $pattern, $edit_text) = @_;    # 引数
    my @lines = @$lines;
    
    for (my $i = 0; $i < @lines; $i++) {
        if ($lines[$i] =~ /$pattern/) {
            $lines[$i] = $edit_text . "\n";
        }else{
            $lines[$i] = $lines[$i];
        }
    }
    
    return @lines;
}


# ファイル書き込み
sub wfile {
    my ($file, @lines) = @_;    # 引数
    my $content = join '', @lines;  # 配列を文字列に変換（空文字列で結合）
    open my $out, '>', $file or die "ファイルを開けません: $!";
    print $out $content;
    close $out;
}




##################################################メイン

my $conf_path = "/etc/httpd/conf/httpd.conf";

# 入力ファイルの内容を読み込む
# /etc/httpd/conf/httpd.conf
my @lines = rfile( $conf_path );


# 66行目付近、編集
@lines = edit_text(\@lines,
    "LoadModule mpm_event_module modules/mod_mpm_event.so",
    "#LoadModule mpm_event_module modules/mod_mpm_event.so"
);


# 67行目付近、編集
@lines = edit_text(\@lines,
    "#LoadModule mpm_prefork_module modules/mod_mpm_prefork.so",
    "LoadModule mpm_prefork_module modules/mod_mpm_prefork.so"
);


# 190行目付近、追記
@lines = insert_text_bottom(\@lines,
    "#LoadModule rewrite_module modules/mod_rewrite.so",
    "\n".
    "# 次の行を LoadModule リストの LoadModule dir_module modules/mod_dir.so の後のどこかに記述:\n".
    "LoadModule php_module modules/libphp.so\n".
    "AddType application/x-httpd-php .php\n".
    "\n"
);


# 530行目付近、最後らへん、追記
@lines = insert_text_top(\@lines,
    "# Secure \\(SSL\\/TLS\\) connections",  # 正規表現でエスケープ
    "\n".
    "# 次の行を Include リストの最後に記述:\n".
    "Include conf/extra/php_module.conf\n".
    "\n"
);


# デバッグ用
#my $datetime = strftime("%Y%m%d_%H%M%S", localtime());
#wfile( $conf_path.$datetime.".bak", @lines);

# 出力ファイルに書き込み
wfile( $conf_path, @lines );

exit;
