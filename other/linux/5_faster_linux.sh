# 关闭开启服务
    # 方法1
        chkconfig --list sendmail  # 查看sendmail
        chkconfig --level 3 sendmail off  # 关闭sendmail 3级启动
    # 方法2
        ntsysv # 去掉前面的＊表示关闭服务，按空格切换，按F12保存退出

