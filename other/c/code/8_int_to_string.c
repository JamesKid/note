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
	int a=1681;
	char s[100];
	itoa(a,s,10);  
	puts(s);
}

