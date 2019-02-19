# ================================JamesKid============================== 
# @author       : JamesKid  
# @description  : This is note about matlab
# @change       :
# ======================================================================

# Command Window
    # command 
        clc           # 清屏
        format short  # (以默认短形输出－单次有效)
        clear b       # 清空b变量
        clear         # 清空整个workspace 内存内容
        doc           # 打开帮助文档
        help          # 打开帮助文档
    # tips
        1. 用分号分割句子
            >> r=2;
            >> S=pi*r^2
        2. 默认只显示5位有效数字(可以在file->preferences->commandwindow->textdisplay->long->ok->重启工具)
        3. 按上下左右，可以查看以前输入过的命令
        4. 紧密显示(可以在file->preferences->commandwindow->textdisplay->compact->ok->重启工具)

# 生成值
    # 矩阵
        ones(5)    # 生成五行五列1矩阵
        zeros(5)   # 生成五行五列0矩阵
        zeros(m,n) # 生成一个 m 行 n 列的零矩阵，m=n 时可简写为 zeros(n)
        ones(m,n)  # 生成一个 m 行 n 列的元素全为 1 的矩阵, 当m=n 时可写为 ones(n)
        eye(m,n)   # 生成一个主对角线全为 1 的 m 行 n 列矩阵, m=n 时可简写为 eye(n)，即为 n 维单位矩阵
        diag(X)    # 若 X 是矩阵，则 diag(X) 为 X 的主对角线向量 若 X 是向量，diag(X) 产生以 X 为主对角线的对角矩阵
        tril(A)    # 提取一个矩阵的下三角部分
        triu(A)    # 提取一个矩阵的上三角部分
        rand(m,n)  # 产生 0～1 间均匀分布的随机矩阵 m=n 时简写为 rand(n)
        randn(m,n) # 产生均值为0，方差为1的标准正态分布随机矩阵m=n 时简写为 randn(n)
        magic(n)   # 生成n阶矩阵，矩阵中的数从1-n^2，且矩阵的横向、纵向、对角线和相等
        hilb(n)    # 生成n阶Hilbert矩阵，其中H(i,j)=1/(i+j-1)






