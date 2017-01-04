# ================================JamesKid============================== 
# @author       : JamesKid  
# @description  : This is note about java
# @change       :
# ======================================================================    

# install 
    # jdk
        # web 
            http://www.linuxidc.com/Linux/2015-12/126375.htm  # install web 
            http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html # download web 
        
        # wget (1.8)

        # in centos
            yum list installed | grep java   # 检查是否安装了java
            yum remove java-1.6.0-openjdk   # 删除旧的jdk
            yum -y list java*   # 查看yum 库中java的安装包
            java -version   # 查看java版本
            javac      # 查看java编译器的命令用法
        # install 
            rpm -ivh jdk-8u65-linux-x64.rpm  # 安装

        # check
            java -version   # 检查java版本,有显示版本则表示安装成功

        # environment
            vim /etc/profile.d/java.sh     # 确保每次初始化时，环境变量都正确：
                #!/bin/bash
                JAVA_HOME=/usr/java/jdk1.8.0_65/   # 此处改为安装相应的版本号
                PATH=$JAVA_HOME:$PATH
                export PATH JAVA_HOME
            chmod 744 /etc/profile.d/java.sh
            source /etc/profile.d/java.sh

    # maven
        # web 
           http://www.centoscn.com/image-text/install/2014/0507/2923.html  # 教程地址
           http://maven.apache.org/download.cgi  # maven 下载地址
           http://www.yiibai.com/maven/create-a-java-project-with-maven.html  # maven 教程

        # 查看是否安装成功
            mvn -v

        # wget 
        # install 
            tar zxvf apache-maven-3.3.9-bin.tar.gz
            ln -s apache-maven-3.2.1  apache-maven   # 建立软链接

        # environment (环境变量)
            vim /etc/profile
                export M2_HOME=/root/zsj/soft/apache-maven-3.3.9
                PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin
                export PATH
            source /etc/profile
                
        # 配置setting.xml 
            修改仓库

        # 拉取仓库
            mvn archetype:generate -DgroupId=com.yiibai -DartifactId=NumberGenerator -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

        # 打包
            mvn package

        # 自动生成项目
            mvn help:system   # 查看系统
            wget http://repo.maven.apache.org/maven2/archetype-catalog.xml
            cp archetype-catalog.xml /root/zsj/soft/apache-maven-3.3.9/
            mvn archetype:generate -DgroupId=com.yiibai -DartifactId=NumberGenerat -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false -DarchetypeCatalog=local -X   # 成生项目,加-X显示具体执行细节, DarchetypeCatalog 使用本地archetype-catalog.xml  NumberGenerat 是生成的项目名

        
# remove (卸载)
    yum -y remove java-1.7.0-openjdk*   # 卸载JDK相关文件,*匹配所有
    yum -y remove tzdata-java.noarch    # 卸载tzdata-java
