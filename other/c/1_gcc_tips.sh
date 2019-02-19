# ================================JamesKid============================== 
# @author        : JamesKid  
# @description : this is the note about c language and gcc
# @change        :
# ======================================================================


# c

# gcc
    # use
        # compile
            gcc test.c
        # run 
            ./a.out
        # filename
            # compile to the filename I want (生成指定的文件名)
            gcc -o i_want.out test.c
            gcc -o i_want.exe test.c
        # process 
            # 1 预处理
                gcc -E test.c -o test.i  或 gcc -E test.c
            # 2 编译为汇编代码(Compilation)
                gcc -S test.i -o test.s
            # 3 汇编(Assembly)
                gcc -c test.s -o test.o   # 些时可以直接 ./test.o 执行
            # 4 链接 (Linking )
                gcc test.o -o test 
        # multy file compile
            gcc test1.c test2.c -o test
            # 以上命令等同以下命令
                gcc -c test1.c -o test1.o
                gcc -c test2.c -o test2.o
.                gcc test1.o test2.o -o test
        # 检错 (让程序与ANSI/ISO c标准兼容)
            gcc -pedantic illcode.c -o illcode
            gcc -Wall illcode.c -o illcode # 使GCC产生尽可能多的警告信息
            gcc -Werror test.c -o test # GCC会在所有产生警告的地方停止编译，迫使程序员对自己的代码进行修改

            



# path 
    # path of .h
        /usr/include
        /usr/local/include
    # <sys/头文件名> <net/文件名>
        /usr/include/sys
    # 4.如果想在指定路径下检索头文件，可加选项-I。如我的/home/Desktop目录下有个头文件local1.h，在编译包含local1.h的test.c文件时，可用：
        gcc test.c -o test -I /root/Desktop。 
        
