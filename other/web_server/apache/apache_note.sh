# ================================JamesKid============================== 
# @author		: JamesKid  
# @description  : this is note about apache
# @change		: 2014_3_5 add apache note
# ======================================================================

# install 
	yum instll httpd

# config 
	# virtual host config
		ServerName duxcms
		NameVirtualHost *:80
		<VirtualHost *:80>   
			ServerName duxcms
			DocumentRoot /var/www/html/duxcms
			<Directory "/var/www/html/duxcms">   
				Options Indexes FollowSymLinks   
				AllowOverride None   
				Order allow,deny   
				Allow from all   
			</Directory>   
		</VirtualHost>   
# path 
	# config file in linux 
		/etc/httpd/conf/httpd.conf

# use tips


# useful web 
	# lnamp server install 
		http://hi.baidu.com/cyrist/item/2d237c4902731de11381dad8	
