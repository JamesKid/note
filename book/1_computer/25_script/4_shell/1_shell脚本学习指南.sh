# ================================JamesKid============================== 
# @author		: JamesKid  
# @description : this is note about 'shell脚本学习指南'
# @change		:
# ======================================================================
# 第1章 背景知识
# 第2章 入门  
	# command
		# wc
			who | wc -l		# count how many line
			who | wc -w		# count how many word
			who | wc -c		# count how many character
		# sed
			sed 's/^/mkdir /' zsj.php	# add 'mkdir' to each line head in zsj.php
			sed 's/^/mkdir /' zsj.php | bash	# execute the sed result
			sed 's/^/mkdir /2' zsj.php 	# match the second one in this line
			sed -n '/aa/p' dir.txt		# print the match aa line,like grep 
			sed -n '10,42p' foo.xml		# print the 10 line to 42 line

			sed -e 's/foo/bar/g' -e 's/chicken/cow/g' myfile.xml > myfile2.xml
										# use two sed command with -e
			# use sed from file
				vim fixup.sed
					s/foo/bar/g
					s/chicken/cow/g
					s/draft animal/horse/g
		
				sed -f fixup.sed myfile.xml > myfile2.xml	
				# example
					# make the html to xhtml
					vim fixup.sed
						s/<H1>/<h1>/g
						s/<H2>/<h2>/g
						s/<H3>/<h3>/g
						s/<H4>/<h4>/g
						s/<H5>/<h5>/g
						s/<H6>/<h6>/g

						s/</H1>/</h1>/g
						s/</H2>/</h2>/g
						s/</H3>/</h3>/g
						s/</H4>/</h4>/g
						s/</H5>/</h5>/g
						s/</H6>/</h6>/g
						....
					sed -f fixup.sed myfile.xml > myfile2.xml
			# tips 
				# 1.POSIX标准指出:完全一致的匹配,指的是自最左边开始匹配,针对每一个
				# 子模式,由左至右,必须匹配到最长的可能字符串
					echo Tostoy is worldly | sed 's/T.*y/Camus/' 
					# result Camus
					echo Tostoy is worldly | sed 's/T[[:alpha:]]*y/Camus/' 
					# result Camus is worldly 
			# character
				\w		# match character
				\W		# match 非单词组成字符
				\<\>	# match word
		# cut
			# command
				cut -d : -f 1,5 /etc/passwd		# 按冒号分,取第一第五个
				ls -l | cut -c 1-10				# get the character from 1 to 10

			
			# tips
				-b		# bytes
				-c		# characters
				-f		# get fields
		# awk 
			awk -F: '{ print $1, $5 }' /etc/passwd	# print 1 and 5 
			awk -F: -v 'OFS=**'  '{ print $1, $5 }' /etc/passwd	# print 1 and 5 
			awk -F: '{ print "User", $1," is really" ,$5 }' /etc/passwd
# 第4章  文本处理工具
	# command
		# sort







