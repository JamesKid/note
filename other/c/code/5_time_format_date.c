#include <stdio.h>  
#include<time.h>
int main(int argc,char *argv[])  
{  
	//time_t t;
	//t=time(0);
	//printf("%s",t);
	time_t rawtime;
	struct tm * timeinfo;
	time(&rawtime);
	timeinfo = localtime(&rawtime);
	printf("\007The current date/time is: %s", asctime (timeinfo));
}
