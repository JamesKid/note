# ================================JamesKid============================== 
# @author       : JamesKid  
# @description : This is note about web secure 
# @change       :
# ======================================================================

# About server 
    # hide server info(隐藏header server)
        # 1 进入nginx安装文件目录（需要重新编译) /var/www/lnmp2.0/src/nginx/
        # 2 修改文件
            vim src/core/nginx.h  (nginx内部名称)
                #define NGINX_VERSION  "1.2.0"   # 这里改成自己想要显示的版本
                #define NGINX_VER      "NGINX/" NGINX_VERSION   # 这里改成自己想要显示的名称写在引号里

            vim src/http/ngx_http_header_filter_module.c  (HTTP ResponseHeader)
                static char ngx_http_server_string[] = "Server: nginx" CRLF;  # 改nginx 为其他

            vim src/http/ngx_http_special_response.c   # 修改错误页的底部Footer 改nginx 为其他
                static u_char ngx_http_error_tail[] =
                "<hr><center>nginx</center>" CRLF
                "</body>" CRLF
                "</html>" CRLF

        # 3 编译 (进入nginx 目录)
            ./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_spdy_module --with-http_gzip_static_module --with-ipv6 --with-http_sub_module 
            # 如果存在文件 /usr/local/include/jemalloc/jemalloc.h  则加 --with-ld-opt='-ljemalloc'
            # 如果存在文件 /usr/local/include/gperftools/tcmalloc.h  则加 --with-google_perftools_module
            make && make install 

NginxMAOpt
# About php
    # hide php version
        vim php.ini
            expose_php = Off # 将expose_php = On 改为Off
            magic_quotes_gpc = On # 打开可以防止sql注入
            display_errors = Off  #  避免暴露php调用mysql的错误信息
            opcache.enable=1      # 开启opcache
            
            
    
