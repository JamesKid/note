#include <stdio.h>  
#include<stdlib.h>
#include<string.h>
#include<time.h>
#include <ctype.h>
void itoa(unsigned long val,char *buf,unsigned radix)   
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
int main(int argc,char *argv[])  {  
	time_t rawtime;
	int unixtime = time(&rawtime);
	char mysqlString[50]="select * from xxx where xxx ";
	char unixtimeString[100];
	itoa(unixtime,unixtimeString,10);  
	strcat(mysqlString,unixtimeString);
	puts(mysqlString);

}
