# ================================JamesKid============================== 
# @author       : JamesKid  
# @description : This is note about kali linux operating system
# @change       :
# ======================================================================

# web 
    http://xiao106347.blog.163.com/blog/static/215992078201342410347137/  # 安装之后的简单设置 
    https://www.kali.org    # 官网
    http://blog.chinaunix.net/uid-26349264-id-4041727.html  # 实战使用


# install 
# config (配置)

    # update 
        vim /etc/apt/sources.list 

        #中科大kali源
            deb http://mirrors.ustc.edu.cn/kali kali main non-free contrib
            deb-src http://mirrors.ustc.edu.cn/kali kali main non-free contrib
            deb http://mirrors.ustc.edu.cn/kali-security kali/updates main contrib non-free
        #阿里云kali源
            deb http://mirrors.aliyun.com/kali kali main non-free contrib
            deb-src http://mirrors.aliyun.com/kali kali main non-free contrib
            deb http://mirrors.aliyun.com/kali-security kali/updates main contrib non-free

        apt-get update  # 刷新系统
        apt-get dist-upgrade  # 安装更新

    # vmware tools
        # 1.请先执行update,upgrade
        sudo apt-get install linux-headers-$(uname -r)  # 更新内核
        # 3.点击虚拟机->安装vmare tools，进入系统后点击



    # font error (字体重叠)    
        apt-get install ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy  # 下载字体包
        gnome-tweak-tool  # 命打开配置－>字体，选为文泉驿微变黑等宽
        apt-get update && apt-get dist-upgrade


        
        
