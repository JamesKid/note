#include <stdio.h>  
#include <mysql/mysql.h>/*注意要包含这个头文件*/
/* yum install mysql-devel # */
/* rpm -ql muysql-devel   # find the path of msyql.h */
/* http://blog.csdn.net/fykhlp/article/details/5950485 */
/* c 语言里function 要写在前面 */
/* port端口在null 前的0,默认端口号用0,非默认则改0成端口号*/
int main(int argc,char *argv[])  
{  
	MYSQL conn;  
	int res;     
	mysql_init(&conn);//初始化 连接  
	if(mysql_real_connect(&conn,"localhost","root","123456","test",0,NULL,CLIENT_FOUND_ROWS))  
	{  
		printf("数据库连接成功/n");  
		res = mysql_query(&conn,"insert into stucent values('user','123456')");//插入语句，成功返回0，失败返回1  
		if(res)  
		{  
			printf("语句执行失败/n");  
			mysql_close(&conn);//记得关闭连接  
		}  
		else  
		{  
			printf("语句执行成功/n");  
			mysql_close(&conn);  
		}  
	}         
	return 0;  
}  

/* 编译要下成面的语句才能成功 */
/* gcc -o test_mysql test_mysql.c `mysql_config --cflags --libs` */
/* #./text_mysql   #to excute */
