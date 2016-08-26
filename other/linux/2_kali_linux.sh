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

    # vmware tool
        # 1. fix source
            vimj /etc/apt/sources.list  # 添加以下两行，其他删除
                #kali官方源
                deb http://http.kali.org/kali kali-rolling main non-free contrib
                #中科大的源
                deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
    
        # 2. update source
            sudo apt-get update 
            sudo apt-get dist-upgrade
            sudo apt-get clean

        # 3. install core 
            sudo apt-get install gcc make linux-headers-$(uname -r)

        # 4. update core 
            apt-get update 
            apt-get dist-upgrade
        # 4. install vmtools
            apt-get install open-vm-tools-desktop fuse
            reboot



    # font error (字体重叠)    
        apt-get install ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy  # 下载字体包
        gnome-tweak-tool  # 命打开配置－>字体，选为文泉驿微米黑等宽
        apt-get update && apt-get dist-upgrade

    # input method (输入法,五笔拼音)
        apt-get install fcitx-table-wbpy ttf-wqy-microhei ttf-wqy-zenhei    
        # ctrl+shit 切换输入法  # ctrl+空格切换中英


        
        
