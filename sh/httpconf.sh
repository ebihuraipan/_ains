#!/bin/bash
source ../.env


cp ../tmpl/httpd.conf.sample ../dep/http.conf

# /etc/httpd/conf/httpd.conf の以下の行をコメントアウトしてください: 
sed -i 's/LoadModule mpm_event_module/#LoadModule mpm_event_module/' ../dep/http.conf

# そして次の行をアンコメントしてください: 
sed -i 's/#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/' ../dep/http.conf

# 次の行を LoadModule リストの LoadModule dir_module modules/mod_dir.so の後のどこかに記述:
sed -i '/^#LoadModule rewrite_module.*$/a\\n\n# 次の行をLoadModuleリストのLoadModule dir_module modules/mod_dir.soの後のどこかに記述' ../dep/http.conf
sed -i '/# 次の行を/a\LoadModule php_module modules/libphp.so' ../dep/http.conf
sed -i '/LoadModule php_module modules/a\AddType application/x-httpd-php .php\n\n'  ../dep/http.conf

#次の行を Include リストの最後に記述:
sed -i '/# Secure .* connections/i\# 次の行をIncludeリストの最後に記述\n\n'  ../dep/http.conf
sed -i '/# 次の行をIncludeリストの最後に記述/a\Include conf/extra/php_module.conf'  ../dep/http.conf


