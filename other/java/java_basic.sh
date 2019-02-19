# java 基础
    # key
        super   
            # 指向自己超（父）类对象的一个指针，而这个超类指的是离自己最近的一个父类。
            # super（参数）：调用父类中的某一个构造函数（应该为构造函数中的第一条语句）。

        final
            # 1. 声明为final的方法不能被重写。
         
        this 
            # this（参数）：调用本类中另一种形式的构造函数（应该为构造函数中的第一条语句）。

        static 
            # 声明为static的方法不能被重写，但是能够被再次声明。
    
    # function
        instanceof    # 判断是否某类的实例

    # 数组遍历
          import java.util.*;
          public class Test{
             public static void main(String[] args) {
                 List<String> list=new ArrayList<String>();
                 list.add("Hello");
                 list.add("World");
                 list.add("HAHAHAHA");
                 //第一种遍历方法使用foreach遍历List
                 for (String str : list) {            //也可以改写for(int i=0;i<list.size();i++)这种形式
                    System.out.println(str);
                 }
             
                 //第二种遍历，把链表变为数组相关的内容进行遍历
                 String[] strArray=new String[list.size()];
                 list.toArray(strArray);
                 for(int i=0;i<strArray.length;i++) //这里也可以改写为  foreach(String str:strArray)这种形式
                 {
                    System.out.println(strArray[i]);
                 }
                 
                //第三种遍历 使用迭代器进行相关遍历
                 
                 Iterator<String> ite=list.iterator();
                 while(ite.hasNext())//判断下一个元素之后有值
                 {
                     System.out.println(ite.next());
                 }
             }
          }


# 设置 CLASSPATH 系统变量

    # 用下面的命令显示当前的CLASSPATH变量：

        Windows 平台（DOS 命令行下）：C:\> set CLASSPATH
        UNIX 平台（Bourne shell 下）：# echo $CLASSPATH

    # 删除当前CLASSPATH变量内容：

        Windows 平台（DOS 命令行下）：C:\> set CLASSPATH=
        UNIX 平台（Bourne shell 下）：# unset CLASSPATH; export CLASSPATH

    # 设置CLASSPATH变量:

        Windows 平台（DOS 命令行下）： C:\> set CLASSPATH=C:\users\jack\java\classes
        UNIX 平台（Bourne shell 下）：# CLASSPATH=/home/jack/java/classes; export CLASSPATH

