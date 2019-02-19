# ================================JamesKid============================== 
# @author		: JamesKid  
# @description :
# @change		: this is about note in emacs
# ======================================================================

# １设置背景颜色 
	vim ~/.bashrc
		(set-background-color "black") ;; 使用黑色背景
		(set-foreground-color "white") ;; 使用白色前景
		(set-face-foreground 'region "green")  ;; 区域前景颜色设为绿色
		(set-face-background 'region "blue") ;; 区域背景色设为蓝色
	restart emacs
# 全屏　

	;;按f2让Emacs进入全屏显示  
	;;   ;;参考： <http://www.emacswiki.org/cgi-bin/wiki/FullScreen>  
		   (defun fullscreen ()  
			   (interactive)  
			   (set-frame-parameter nil 'fullscreen  
			   (if (frame-parameter nil 'fullscreen) nil 'fullboth))
			)  
			(global-set-key [f2] 'fullscreen)  
# key
	c-x c-f # reading photo
