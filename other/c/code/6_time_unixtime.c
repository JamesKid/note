#include <stdio.h>  
#include<time.h>
int main(int argc,char *argv[])  
{  
	time_t rawtime;
	time(&rawtime);
	printf("\007The current date/time is: %d", rawtime);
}
