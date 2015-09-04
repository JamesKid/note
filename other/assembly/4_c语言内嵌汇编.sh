main() { 
char *c="hello,world\n\r$"; 
asm mov ah,9 
asm mov dx,c 
asm int 33 
printf("You sucessed!"); 
} 

/*************** C内嵌汇编示例 ***************/ 
#include "stdio.h" 
#include "conio.h" 
int min(int v1,int v2) 
{asm mov ax,v1; 
asm cmp ax,v2; 
asm jle minexit; 
asm mov ax,v2; 
minexit: 
return(_AX); 
} 

main() {
	printf("min(10,3) is %d\nmin(34,552) is %d",min(10,3),min(34,552)); 
	getch(); 
}
