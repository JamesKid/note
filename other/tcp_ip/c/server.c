/* Chat on Linux Terminal--alpha 
* Worte by Jimmy's team@uestc 
*  * 2011-2-23 
*  * 
*  * This is the sorce code of server 
*  * Some BUGS still unsloved, but we are trying our best to debug 
*  * Be sure that your system's port "1234" is not busy! 
*   
*  * */  

#include<stdio.h>  
#include<stdlib.h>  
#include<errno.h>  
#include<string.h>  
#include<netdb.h>  
#include<unistd.h>  
#include<sys/types.h>  
#include<sys/socket.h>  
#include<sys/time.h>  
#include<sys/un.h>  
#include<sys/ioctl.h>  
#include<sys/wait.h>  
#include<netinet/in.h>  
#include<arpa/inet.h>  

#define SERVPORT 1234  
#define BACKLOG 20  
#define MAX_CON_NO 10  
#define MAX_DATA_SIZE 1024  

int main(int argc, char *argv[]) {  
	struct sockaddr_in serverSockaddr, clientSockaddr;  
	int sinSize, recvBytes, sendBytes;  
	fd_set readfd;  
	fd_set writefd;  
	int sockfd, clientfd;  
	char sendBuf[MAX_DATA_SIZE], recvBuf[MAX_DATA_SIZE];  

	if(argc != 1) {  
		printf("usage:./server\n");  
		exit(1);  
	}  

	/*establish a socket*/  
	if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {  
		perror("fail to establish a socket");  
		exit(1);  
	}  
	printf("Success to establish a socket...(sockfd = %d)\n", sockfd);  

	/*init sockaddr_in*/  
	serverSockaddr.sin_family = AF_INET;  
	serverSockaddr.sin_port = htons(SERVPORT);  
	serverSockaddr.sin_addr.s_addr = htonl(INADDR_ANY);  
	bzero(&(serverSockaddr.sin_zero), 8);  

	int on = 1;   
	setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));  

	/*bind socket*/  
	if(bind(sockfd, (struct sockaddr *)&serverSockaddr, sizeof(struct sockaddr))== -1) {  
		perror("fail to bind");  
		exit(1);  
	}  
	printf("Success to bind the socket...\n");  


	/*listen on the socket*/  
	if(listen(sockfd, BACKLOG) == -1) {  
		perror("fail to listen");  
		exit(1);  
	}  
	printf("Success to listen on the socket...\n");  

	while(1) {  
		FD_ZERO(&readfd);  
		FD_SET(sockfd, &readfd);  
		sinSize = sizeof(struct sockaddr_in);  
		if(select(MAX_CON_NO, &readfd, NULL, NULL, (struct timeval *)0) > 0) {  
			if(FD_ISSET(sockfd, &readfd) > 0) {  

				/*accept a client's request*/  
				if((clientfd = accept(sockfd, (struct sockaddr *)&clientSockaddr, &sinSize)) == -1) {  
					perror("fail to accept");  
					exit(1);  
				}  
				printf("Success to accpet a connection request...\n");  
				printf("\033[40;32m%s join in!\033[1m\n", inet_ntoa(clientSockaddr.sin_addr));//include color set  

					while(1) {  
						/*receive datas from client*/  
						if((recvBytes = recv(clientfd, recvBuf, MAX_DATA_SIZE, 0)) == -1) {  
							perror("fail to receive datas");  
							exit(1);  
						}  
						printf("Client:%s\n", recvBuf);  
						memset(recvBuf, 0x00, MAX_DATA_SIZE);  

						/*send datas to client*/  
						printf("Server:");  
						gets(sendBuf);  
						if((sendBytes = send(clientfd, sendBuf, strlen(sendBuf), 0)) != strlen(sendBuf)) {  
							perror("fail to send datas");  
							exit(1);  
						}  
						printf("(Success to send data!)\n");  
						memset(sendBuf, 0x00, MAX_DATA_SIZE);  
					}  
			}  
			close(sockfd);  
		}  
	}  
}  
