# ================================JamesKid============================== 
# @author       : JamesKid  
# @description  : This is note about java
# @change       :
# ======================================================================    

# install 
    # in centos
        yum list installed | grep java   # 检查是否安装了java
        yum -y list java*   # 查看yum 库中java的安装包
        java -version   # 查看java版本
        javac      # 查看java编译器的命令用法
        
# remove (卸载)
    yum -y remove java-1.7.0-openjdk*   # 卸载JDK相关文件,*匹配所有
    yum -y remove tzdata-java.noarch    # 卸载tzdata-java
