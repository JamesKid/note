无论学习哪门计算机语言，只要把100例中绝大部分题目都做一遍，就基本掌握该语言的语法了。

【程序1】

题目：有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数？都是多少？
复制代码

1 #Filename:001.py
2 cnt = 0#count the sum of result
3 for i in range(1,5):
4     for j in range(1,5):
5         for k in range(1,5):
6             if i!=j and i!=k and j!=k:
7                 print i*100+j*10+k

复制代码

【程序2】

题目：企业发放的奖金根据利润提成。利润(I)低于或等于10万元时，奖金可提10%；利润高于10万元，低于20万元时，低于10万元的部分按10%提成，高于10万元的部分，可可提成7.5%；20万到40万之间时，高于20万元的部分，可提成5%；40万到60万之间时高于40万元的部分，可提成3%；60万到100万之间时，高于60万元的部分，可提成1.5%，高于100万元时，超过100万元的部分按1%提成，从键盘输入当月利润I，求应发放奖金总数？
复制代码

 1 #Filename:002.py
 2 i = int(raw_input('Enter the profit:'))
 3 arr = [1000000,600000,400000,200000,100000,0]
 4 rat = [0.01,0.015,0.03,0.05,0.075,0.1]
 5 r = 0
 6 for idx in range(0,6):
 7     if i>arr[idx]:
 8         r+=(i-arr[idx])*rat[idx]
 9         print (i-arr[idx])*rat[idx]
10         i=arr[idx]
11 print r

复制代码

【程序3】

题目：一个整数，它加上100后是一个完全平方数，再加上168又是一个完全平方数，请问该数是多少？
复制代码

1 #Filename:003.py
2 import math
3 for i in range(2,1000):
4     if (math.sqrt(i+100)*math.sqrt(i+100) == i+100 )and(math.sqrt(i+168)*math.sqrt(i+168) == i+168):
5         print math.sqrt(i+100)
6         print math.sqrt(i+168)
7         break
8 print i

复制代码

 

【程序4】

题目：输入某年某月某日，判断这一天是这一年的第几天？

【程序5】
题目：输入三个整数x,y,z，请把这三个数由小到大输出。

【程序8】
题目：输出9*9口诀。

1 for i in range(1,10):
2     for j in range(1,i+1):
3         print i,'*',j,'=',i*j,
4     print ''

 

【程序11】
题目：古典问题：有一对兔子，从出生后第3个月起每个月都生一对兔子，小兔子长到第三个月
　　　后每个月又生一对兔子，假如兔子都不死，问每个月的兔子总数为多少？
复制代码

1 a = 1
2 b = 1
3 for i in range(1,21,2):
4     print '%d %d'%(a,b),
5     a += b
6     b += a

复制代码

【程序12】
题目：判断101-200之间有多少个素数，并输出所有素数。
复制代码

 1 #!/usr/bin/python
 2 #-*- coding:utf-8 -*-
 3 from math import sqrt 
 4 def main():
 5     for i in range(101,201):
 6         flag = 1
 7         k = int(sqrt(i))
 8         for j in range(2,k+1):
 9             if i%j == 0:
10                 flag = 0
11                 break
12         if flag == 1:
13             print '%5d'%(i),
14     
15 if __name__ == "__main__":
16     main()

复制代码

【程序13】
题目：打印出所有的“水仙花数”，所谓“水仙花数”是指一个三位数，其各位数字立方和等于该数本身。例如：153是一个“水仙花数”，因为153=1的三次方＋5的三次方＋3的三次方。

 
复制代码

 1 #!/usr/bin/python
 2 #-*- coding:utf-8 -*-
 3 def main():
 4     for i in range(100,1000):
 5         a = i%10
 6         b = i/100
 7         c = (int(i/10))%10
 8         if i == a**3+b**3+c**3:
 9             print "%5d"%(i),
10 
11 if __name__ == "__main__":
12     main()

复制代码

【程序14】
题目：将一个正整数分解质因数。例如：输入90,打印出90=2*3*3*5。
复制代码

 1 #!/usr/bin/python
 2 #-*- coding:utf-8 -*-
 3 
 4 def main():
 5     n = int(raw_input('Enter a number:'))
 6     print n,'=',
 7     while(n!=1):
 8         for i in range(2,n+1):
 9             if (n%i)==0:
10                 n/=i
11                 if(n == 1):
12                     print '%d'%(i)
13                 else:
14                     print '%d *'%(i),
15                 break
16             
17         
18 if __name__ == "__main__":
19     main()

复制代码

【程序15】
题目：利用条件运算符的嵌套来完成此题：学习成绩>=90分的同学用A表示，60-89分之间的用B表示，60分以下的用C表示。

 
复制代码

 1 #!/usr/bin/python
 2 #-*- coding:utf-8 -*-
 3 def main():
 4     s = int(raw_input('Enter a number:'))
 5     if s>=90:
 6         grade = 'A'
 7     elif s>=60:
 8         grade = 'B'
 9     else:
10         grade = 'C'
11     print grade,
12 
13 if __name__ == '__main__':
14     main()

复制代码

【程序17】
题目：输入一行字符，分别统计出其中英文字母、空格、数字和其它字符的个数。
复制代码

 1 #!/usr/bin/python
 2 #-*- coding:utf-8 -*-
 3 #there is no ++ operator in Python
 4 import string
 5 def main():
 6     s = raw_input('input a string:')
 7     letter = 0
 8     space = 0
 9     digit = 0
10     other = 0
11     for c in s:
12         if c.isalpha():
13             letter+=1
14         elif c.isspace():
15             space+=1
16         elif c.isdigit():
17             digit+=1
18         else:
19             other+=1
20     print 'There are %d letters,%d spaces,%d digits and %d other characters in your string.'%(letter,space,digit,other)
21 
22 if __name__ == '__main__':
23     main()

复制代码

【程序18】

题目：求s=a+aa+aaa+aaaa+aa...a的值，其中a是一个数字。例如2+22+222+2222+22222(此时共有5个数相加)，几个数相加有键盘控制。

 
复制代码

 1 #!/usr/bin/python
 2 #-*- coding:utf-8 -*-
 3 def main():
 4     basis = int(raw_input("Input the basis number:"))
 5     n = int(raw_input("Input the longest length of number:"))
 6     b = basis
 7     sum = 0
 8     for i in range(0,n):
 9         if i==n-1:
10             print "%d "%(basis),
11         else:
12             print "%d +"%(basis),
13         sum+=basis
14         basis = basis*10+b
15     print '= %d'%(sum),
16     
17 
18 if __name__ == '__main__':
19     main()

复制代码

 【程序19】
题目：一个数如果恰好等于它的因子之和，这个数就称为“完数”。例如6=1＋2＋3.编程
　　　找出1000以内的所有完数。
复制代码

 1 from math import sqrt
 2 n = int(raw_input('input a number:'))
 3 sum = n*-1
 4 k = int(sqrt(n))
 5 for i in range(1,k+1):
 6     if n%i == 0:
 7         sum += n/i
 8         sum += i
 9 if sum == n:
10     print 'YES'
11 else:
12     print 'NO'

复制代码

 
复制代码

 1 '''
 2 【程序20】
 3 题目：一球从100米高度自由落下，每次落地后反跳回原高度的一半；再落下，求它在
 4 　　　第10次落地时，共经过多少米？第10次反弹多高？
 5 '''
 6 s = 100.
 7 h = 50.0
 8 for i in range(2,11):
 9     s += h
10     h /= 2
11 print "the sum length of path:%f"%s
12 print "the last height is:%f"%h

复制代码
复制代码

 1 '''
 2  【程序21】
 3 题目：猴子吃桃问题：猴子第一天摘下若干个桃子，当即吃了一半，还不瘾，又多吃了一个
 4 　　　第二天早上又将剩下的桃子吃掉一半，又多吃了一个。以后每天早上都吃了前一天剩下
 5 　　　的一半零一个。到第10天早上想再吃时，见只剩下一个桃子了。求第一天共摘了多少。
 6 '''
 7 n = 1
 8 for i in range(9,0,-1):
 9     n = (n+1)<<1
10 print n

复制代码
复制代码

 1 '''
 2 ★
 3 【程序22】
 4 题目：两个乒乓球队进行比赛，各出三人。甲队为a,b,c三人，乙队为x,y,z三人。已抽签决定
 5 　　　比赛名单。有人向队员打听比赛的名单。a说他不和x比，c说他不和x,z比，请编程序找出
 6 　　　三队赛手的名单。 
 7 '''
 8 for i in range(ord('x'),ord('z') + 1):
 9     for j in range(ord('x'),ord('z') + 1):
10         if i != j:
11             for k in range(ord('x'),ord('z') + 1):
12                 if (i != k) and (j != k):
13                     if (i != ord('x')) and (k != ord('x')) and (k != ord('z')):
14                         print 'order is a -- %s\t b -- %s\tc--%s' % (chr(i),chr(j),chr(k))

复制代码
复制代码

 1 '''
 2 【程序23】 
 3 题目：打印出如下图案（菱形）
 4 
 5    *
 6   ***
 7  *****
 8 *******
 9  *****
10   ***
11    *
12 '''
13 for i in range(1,8,2):
14     print ' '*(4-(i+1)/2)+'*'*i
15 for i in range(5,0,-2):
16     print ' '*(4-(i+1)/2)+'*'*i

复制代码
复制代码

 1 '''
 2 【程序24】 
 3 题目：有一分数序列：2/1，3/2，5/3，8/5，13/8，21/13...求出这个数列的前20项之和。
 4 '''
 5 u = 2.0
 6 d = 1.0
 7 s = 0.0
 8 for i in range(0,20):
 9     s = s+u/d
10     u = u+d
11     d = u-d
12 print '%f'%s

复制代码
复制代码

 1 '''
 2 【程序25】 
 3 题目：求1+2!+3!+...+20!的和
 4 '''
 5 s = 0
 6 t = 1
 7 for i in range(1,21):
 8     t*=i
 9     s+=t
10 print s

复制代码
复制代码

 1 '''
 2 【程序26】 
 3 题目：利用递归方法求5!。
 4 '''
 5 def fun(i):
 6     if i==1:
 7         return 1
 8     return i*fun(i-1)
 9 
10 print fun(5)

复制代码
复制代码

 1 '''
 2 【程序27】 
 3 题目：利用递归函数调用方式，将所输入的5个字符，以相反顺序打印出来。
 4 '''
 5 def output(s,l):
 6     if l==0:
 7         return
 8     print s[l-1]
 9     output(s,l-1)
10 
11 s = raw_input('Input a string:')
12 l = len(s)
13 output(s,l)

复制代码
复制代码

 1 '''
 2 【程序28】 
 3 题目：有5个人坐在一起，问第五个人多少岁？他说比第4个人大2岁。问第4个人岁数，他说比第
 4 　　　3个人大2岁。问第三个人，又说比第2人大两岁。问第2个人，说比第一个人大两岁。最后 
 5 　　　问第一个人，他说是10岁。请问第五个人多大？
 6 '''
 7 def fun(i):
 8     if i==1:
 9         return 10
10     return fun(i-1)+2
11 
12 print fun(5)

复制代码
复制代码

 1 '''
 2 【程序29】 
 3 题目：给一个不多于5位的正整数，要求：一、求它是几位数，二、逆序打印出各位数字。
 4 '''
 5 def fun(i,cnt):
 6     if i==0:
 7         print 'There are %d digit in the number.'%cnt
 8         return
 9     print i%10,
10     i/=10
11     cnt+=1
12     fun(i,cnt)
13 
14 i = int(raw_input('Input a number:'))
15 fun(i,0)

复制代码
复制代码

 1 '''
 2 【程序30】
 3 题目：一个5位数，判断它是不是回文数。即12321是回文数，个位与万位相同，十位与千位相同。　　　
 4 '''
 5 ans=['Yes','No']
 6 i = int(raw_input('Input a number(10000~99999):'))
 7 if i<10000 or i>99999:
 8     print 'Input Error!'
 9 else:
10     i = str(i)
11     flag = 0
12     for j in range(0,2):
13         if i[j]!=i[4-j]:
14             flag = 1
15             break
16     print ans[flag]

复制代码
复制代码

 1 '''
 2 【程序36】【筛选法】
 3 题目：求100之内的素数　　　
 4 '''
 5 a = [0]*101
 6 for i in range(2,11):
 7     for j in range(i+i,101,i):
 8         a[j]=-1;
 9 for i in range(2,101):
10     if a[i]!=-1:
11         print ' ',i,

复制代码
复制代码

 1 '''
 2 【程序37】
 3 题目：对10个数进行排序
 4 '''
 5 print 'input 10 numbers please:'
 6 l = []
 7 for i in range(10):
 8     l.append(int(raw_input('Input a number:')))
 9 #可以直接使用sort函数：l.sort()
10 #也可以自己写排序代码(选择排序)
11 for i in range(9):
12     for j in range(i+1,10):
13         if l[j]<l[i]:
14             temp = l[j]
15             l[j] = l[i]
16             l[i] = temp    
17 print l

复制代码
复制代码

 1 '''
 2 【程序38】
 3 题目：求一个3*3矩阵对角线元素之和 
 4 '''
 5 l = []
 6 for i in range(3):
 7     for j in range(3):
 8         l.append(int(raw_input('Input a number:')))
 9 s = 0
10 for i in range(3):
11     s += l[3*i+i]
12 print s

复制代码

 
复制代码

 1 '''
 2 【程序39】
 3 题目：有一个已经排好序的数组。现输入一个数，要求按原来的规律将它插入数组中。
 4 '''
 5 l = [0,10,20,30,40,50]
 6 
 7 print 'The sorted list is:',l
 8 cnt = len(l)
 9 n = int(raw_input('Input a number:'))
10 l.append(n)
11 for i in range(cnt):
12     if n<l[i]:
13         for j in range(cnt,i,-1):
14             l[j] = l[j-1]
15         l[i] = n
16         break
17 print 'The new sorted list is:',l

复制代码

 
复制代码

 1 '''
 2 【程序40】
 3 题目：将一个数组逆序输出。
 4 '''
 5 a = [1,2,3,4,5,6,7,8,9]
 6 l = len(a)
 7 print a
 8 for i in range(l/2):
 9     a[i],a[l-i-1] = a[l-i-1],a[i] #注意此句
10 print a

复制代码
复制代码

1 '''
2 【程序41】
3 题目：学习static定义静态变量的用法　　　
4 题目：学习使用auto定义变量的用法
5 题目：学习使用external的用法
6 题目：学习使用register定义变量的方法
7 题目：宏#define命令练习
8 '''
9 #Python没有这些功能

复制代码
复制代码

 1 '''
 2 演示lambda的使用。
 3 '''
 4 MAXIMUM = lambda x,y :  (x > y) * x + (x < y) * y
 5 MINIMUM = lambda x,y :  (x > y) * y + (x < y) * x
 6 
 7 if __name__ == '__main__':
 8     a = 10
 9     b = 20
10     print 'The largar one is %d' % MAXIMUM(a,b)
11     print 'The lower one is %d' % MINIMUM(a,b)

复制代码
复制代码

 1 '''
 2 【程序51】
 3 题目：学习使用按位与 & 。　　　
 4 程序分析：0&0=0; 0&1=0; 1&0=0; 1&1=1
 5 
 6 题目：学习使用按位或 | 。
 7 程序分析：0|0=0; 0|1=1; 1|0=1; 1|1=1　
 8 
 9 题目：学习使用按位异或 ^ 。　　　
10 程序分析：0^0=0; 0^1=1; 1^0=1; 1^1=0
11 
12 题目：学习使用按位取反~。　　　
13 程序分析：~0=1; ~1=0
14 
15 '''
16 a = 077#8进制
17 b = a&3
18 print '077&3=%d'%b
19 b&=7
20 print '077&3&7=%d'%b
21 
22 a = 077
23 b = a | 3
24 print '077|3=%d' % b
25 b |= 7
26 print '077|3|7=%d' % b
27 
28 a = 077
29 b = a ^ 3
30 print '077^3=%d' % b
31 b ^= 7
32 print '077^3^7=%d' % b

复制代码
复制代码

1 '''
2 【程序54】
3 题目：取一个整数a从右端开始的4～7位。
4 '''
5 a = 100
6 print 100&0x00F0

复制代码
复制代码

 1 '''
 2 【程序56】
 3 题目：画圆【Tkinter模块】
 4 '''
 5 if __name__ == '__main__':
 6     from Tkinter import *
 7 
 8     canvas = Canvas(width=800, height=600, bg='red')  
 9     canvas.pack(expand=YES, fill=BOTH)                
10     k = 1
11     j = 1
12     for i in range(0,26):
13         canvas.create_oval(310 - k,250 - k,310 + k,250 + k, width=1)
14         k += j
15         j += 0.3
16 
17     mainloop()

复制代码
复制代码

 1 '''
 2 【程序57】
 3 题目：画直线。
 4 1.程序分析：　　　　　　　　　　　
 5 2.程序源代码： 
 6 '''
 7 if __name__ == '__main__':
 8     from Tkinter import *
 9 
10     canvas = Canvas(width=300, height=300, bg='green')   
11     canvas.pack(expand=YES, fill=BOTH)                  
12     x0 = 263
13     y0 = 263
14     y1 = 275
15     x1 = 275
16     for i in range(19):
17         canvas.create_line(x0,y0,x0,y1, width=1, fill='red')
18         x0 = x0 - 5
19         y0 = y0 - 5
20         x1 = x1 + 5
21         y1 = y1 + 5
22 
23     x0 = 263
24     y1 = 275
25     y0 = 263
26     for i in range(21):
27         canvas.create_line(x0,y0,x0,y1,fill = 'red')
28         x0 += 5
29         y0 += 5
30         y1 += 5
31 
32     mainloop()

复制代码
复制代码

 1 '''
 2 【程序58】
 3 题目：画方形。　　　
 4 '''
 5 if __name__ == '__main__':
 6     from Tkinter import *
 7     root = Tk()
 8     root.title('Canvas')
 9     canvas = Canvas(root,width = 400,height = 400,bg = 'yellow')
10     x0 = 263
11     y0 = 263
12     y1 = 275
13     x1 = 275
14     for i in range(19):
15         canvas.create_rectangle(x0,y0,x1,y1)
16         x0 -= 5
17         y0 -= 5
18         x1 += 5
19         y1 += 5
20         
21     canvas.pack()
22     root.mainloop()

复制代码
复制代码

 1 '''
 2 题目：画图，综合例子。
 3 1.程序分析：
 4 2.程序源代码：
 5 '''
 6 if __name__  == '__main__':
 7     from Tkinter import *
 8     canvas = Canvas(width = 300,height = 300,bg = 'green')
 9     canvas.pack(expand = YES,fill = BOTH)
10     x0 = 150
11     y0 = 100
12     canvas.create_oval(x0 - 10,y0 - 10,x0 + 10,y0 + 10)
13     canvas.create_oval(x0 - 20,y0 - 20,x0 + 20,y0 + 20)
14     canvas.create_oval(x0 - 50,y0 - 50,x0 + 50,y0 + 50)
15     import math
16     B = 0.809
17     for i in range(16):
18         a = 2 * math.pi / 16 * i
19         x = math.ceil(x0 + 48 * math.cos(a))
20         y = math.ceil(y0 + 48 * math.sin(a) * B)
21         canvas.create_line(x0,y0,x,y,fill = 'red')
22     canvas.create_oval(x0 - 60,y0 - 60,x0 + 60,y0 + 60)
23     
24 
25     for k in range(501):
26         for i in range(17):
27             a = (2 * math.pi / 16) * i + (2 * math.pi / 180) * k
28             x = math.ceil(x0 + 48 * math.cos(a))
29             y = math.ceil(y0 + 48 + math.sin(a) * B)
30             canvas.create_line(x0,y0,x,y,fill = 'red')
31         for j in range(51):
32             a = (2 * math.pi / 16) * i + (2* math.pi / 180) * k - 1
33             x = math.ceil(x0 + 48 * math.cos(a))
34             y = math.ceil(y0 + 48 * math.sin(a) * B)
35             canvas.create_line(x0,y0,x,y,fill = 'red')
36     mainloop()
