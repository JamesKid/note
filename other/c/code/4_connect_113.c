#include <stdio.h>  
#include<stdlib.h>
#include<string.h>
#include<time.h>
//#include <ctype.h>
#include <mysql/mysql.h>/*注意要包含这个头文件*/
/* yum install mysql-devel # */
/* rpm -ql mysql-devel   # find the path of msyql.h */
/* ubuntu sudo apt-get install libmysqld-dev */
/* http://blog.csdn.net/fykhlp/article/details/5950485 */
/* c 语言里function 要写在前面 */

void itoa(unsigned long val,char *buf,unsigned radix)   /* 整型转字符型函数 */
{   
	char *p;
	char *firstdig;
	char temp;
	unsigned digval;
	p = buf;
	firstdig=p;
	do{
		digval = (unsigned)(val%radix);
		val /= radix;
		if(digval>9)
			*p++=(char)(digval-10+'a');
		else
			*p++=(char)(digval+'0');
	}while(val>0);
	*p--='\0';
	do{
		temp=*p;
		*p=*firstdig;
		*firstdig=temp;
		--p;
		++firstdig;
	}while(firstdig<p);
}
int main(int argc,char *argv[])  
{  
	MYSQL conn;  
	int res;     
	
	/* 链接字符串 */
	time_t rawtime;
	int unixtime = time(&rawtime)-600;
	char mysqlString[50]="delete from comm_realtimelogs where logs_time <";
	char unixtimeString[100];
	itoa(unixtime,unixtimeString,10);  
	strcat(mysqlString,unixtimeString);
	//puts(mysqlString);
	mysql_init(&conn);//初始化 连接  
	if(mysql_real_connect(&conn,"xx.xx.xx.xx","username","password","database",port,NULL,CLIENT_FOUND_ROWS))  
	{  
		printf("数据库连接成功/n");  
		res = mysql_query(&conn,mysqlString);//删除语句，成功返回0，失败返回1  
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
