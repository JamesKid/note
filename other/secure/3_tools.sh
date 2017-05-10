# ================================JamesKid============================== 
# @author       : JamesKid  
# @description :  This is note about secure tools note 
# @change       :
# ======================================================================

# 1 Information Gathering (信息收集)
    # dnmap_client 

    # dnmap_server

    # host  -------( get url's ip,alway's multy 获取url的对应多个ip)
        # use 
            host www.baidu.com
            host -a baidu.com 8.8.8.8 # 查询详细的记录
        # tips
            一般
    # dig -------(DNS 服务器挖掘)
        # use 
            dig baidu.com
    # dnsenum (dns及 mail服务器扫描)
        # use 
            dnsenum baidu.com
    # fierce 
        # use 
            fierce -dns baidu.com -threads 3

    # dmitry (扫描网站端口)
        dmitry -p baidu.com -f -b

    # theharvester ------(查看ip下对应的二级域名头，如 email.baidu.com a.baidu.com) ******
        theharvester -d baidu.com -l 100 -b bing   # 通过bind收集
        theharvester -d baidu.com -l 100 -b baidu  # 通过baidu收集

    # metagoofil ---------(利用Google收集信息的工具)
        metagoofil -d baidu.com -l 20 -t doc,pdf -n 5  -f test.html -o test


    # ike-scan
        # web 
            https://github.com/royhills/ike-scan 
        # use 
            ike-scan 192.168.1.155
            ike-scan 192.168.1.0-192.168.1.255  # 扫描指定ip之间

    # maltego (社会工程学分析工具)

    # netdiscover (ARP侦查)
        # use 
            netdiscover # 查看当前获取的ARP信息
    # p0f (新的远程OS 指纹被动判别工具)
        # use 
            p0f   # 监听登录，能获取登录者操作系统,ip,端口
            p0f -i eth0 # 扫描eth0网卡

    # shodan （搜索工具,可以按关键字搜索跌幅器，ip)
        # web 
            www.shodan.io

    # whois -------(domain name collect - 域名信息收集)
        # install 
            sudo apt-get install whois
        # use 
            whois xxxx.com  # 查询xxx 网站的信息,相关人员电话,email,地点,注册时间


# 2  Vulnerability Analysis(漏洞分析)
    # wpscan (word press 漏洞扫描)
        

# 3  Web Application Analysis(web程序)

    # skipfish (google公司发布的一款自动web安全扫描程序) ★★★★★
        # install 
            yum install skipfish
        # use 
            skipfish -o /tmp/output_result http://www.example.com

# 4  Database Assessment(数据库评估软件)

# 5  Password Attacks (密码相关)

# 6  Wireless Attacks (无线相关)

# 7  Reverse Engineering (逆向工程)

# 8  Exploitation Tools (漏洞利用工具集)

# 9  Sniffing & Spoofing  ()

# 10 Post Exploitation  ()

# 11 Forensics（数字取证)
    # binwalk (分析编译后的文件，如.bin .exe .img 等二进制文件)

# 12 Reporting Tools (报告工具)

# 13 Social Engineering Tools

# 14 System Services (系统服务)

# 15 secure (安全工具)
    # lynis (扫描linux 漏洞)
        # install 
            wget http://cisofy.com/files/lynis-1.6.3.tar.gz
            tar zxvf lynis-1.6.3.tar.gz 
            cd lynis-1.6.3
         # use 
            ./lynis --check-all -Q   # 执行扫描
