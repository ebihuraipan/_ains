package Sub;

# ファイル書き込み
sub wfile {
    my ($file, @lines) = @_;    # 引数
    my $content = join '', @lines;  # 配列を文字列に変換（空文字列で結合）
    open my $out, '>', $file or die "ファイルを開けません: $!";
    print $out $content;
    close $out;
}

# ファイル読み込み
sub rfile {
    my ($file) = @_;
    open my $in, '<', $file or die "元のファイルを開けません: $!";
    my @lines = <$in>;
    close $in;
    return @lines;
}

# 上に追記
sub add_text_top {
    my ($lines, $target_str, $add_str) = @_; # 引数
    my @result;
    foreach my $line (@$lines) {
        if ($line =~ /$target_str/) {
            push @result, $add_str . "\n";
        }
        push @result, $line;
    }
    return @result;
}

# 下に追記
sub add_text_bottom {
    my ($lines, $target_str, $add_str) = @_; # 引数
    my @result;
    foreach my $line (@$lines) {
        push @result, $line;
        if ($line =~ /$target_str/) {
            push @result, $add_str . "\n";
        }
    }
    return @result;
}

# 編集
sub edit_text {
    my ($lines, $target_str, $edit_str) = @_; # 引数
    my @result;
    foreach my $line (@$lines) {
        if ($line =~ /$target_str/) {
            push @result, $edit_str . "\n";
        } else {
            push @result, $line;
        }
    }
    return @result;
}

1;
