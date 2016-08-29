# ================================JamesKid============================== 
# @author       : JamesKid  
# @description : This is note about web secure 
# @change       :
# ======================================================================

# About server 
    # hide server info(隐藏header server)
        vim fastcgi.conf
            # fastcgi_param SERVER_SOFTWARE nginx/$nginx_version; # 将这行改为如下
            fastcgi_param SERVER_SOFTWARE myserver;  

# About php
    # hide php version
        vim php.ini
            expose_php = Off # 将expose_php = On 改为Off
            magic_quotes_gpc = On # 打开可以防止sql注入
            
            
    
