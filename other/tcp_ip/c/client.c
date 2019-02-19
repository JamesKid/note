/* * Chat on Linux Terminal--alpha 
*  * Worte by Jimmy's team@uestc 
*  * 2011-2-23 
*  * 
*  * This is the sorce code of client 
*  * Some BUGS still unsloved, but we are trying our best to debug 
*  * Be sure that your system's port "1234" is not busy! 
*  * 
*  * */  
#include<stdio.h>  
#include<stdlib.h>  
#include<errno.h>  
#include<string.h>  
#include<netdb.h>  
#include<sys/types.h>  
#include<sys/socket.h>  
#include<netinet/in.h>  
#include<arpa/inet.h>  
#define SERVPORT 1234  
#define MAX_DATA_SIZE 1024  
int main(int argc, char *argv[]) {  
	int sockfd, sendBytes,recvBytes;  
	char sendBuf[MAX_DATA_SIZE],recvBuf[MAX_DATA_SIZE];  
	struct hostent *host;  
	struct sockaddr_in servAddr;  
	if(argc != 2) {  
		fprintf(stderr,"usage:./client [hostname]");  
		exit(1);  
	}  
	/*translate the address*/  
	if((host = gethostbyname(argv[1])) == NULL) {  
		perror("fail to get host by name");  
		exit(1);  
	}  
	printf("Success to get host by name...\n");  
	/*establish a socket*/  
	if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {  
		perror("fail to establish a socket");  
		exit(1);  
	}  
	printf("Success to establish a socket...\n");  
	/*init sockaddr_in*/  
	servAddr.sin_family = AF_INET;  
	servAddr.sin_port = htons(SERVPORT);  
	servAddr.sin_addr = *((struct in_addr *)host -> h_addr);  
	bzero(&(servAddr.sin_zero), 8);  
	/*connect the socket*/  
	if(connect(sockfd, (struct sockaddr *)&servAddr, sizeof(struct sockaddr_in)) == -1) {  
		perror("fail to connect the socket");  
		exit(1);  
	}  
	printf("Success to connect the socket...\n");  
	printf("\033[40;32mWelcome to join %s!\033[1m\n", inet_ntoa(servAddr.sin_addr));    //include color set  
		while(1) {  
			/*send datas to server*/  
			printf("Client:");  
			gets(sendBuf);  
			if((sendBytes = send(sockfd, sendBuf, strlen(sendBuf), 0)) != strlen(sendBuf)) {  
				perror("fail to send datas");  
				exit(1);  
			}  
			printf("(Success to send data!)\n");  
			memset(sendBuf, 0x00, MAX_DATA_SIZE);  
			/*receive datas from server*/  
			if((recvBytes = recv(sockfd, recvBuf, MAX_DATA_SIZE, 0)) == -1) {  
				perror("fail to receive datas");  
				exit(1);  
			}  
			printf("Server: %s \n", recvBuf);  
			memset(recvBuf, 0x00, MAX_DATA_SIZE);  
		}  
		close(sockfd);  
}  
