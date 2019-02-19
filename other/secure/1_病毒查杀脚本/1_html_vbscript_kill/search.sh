#!/bin/sh
grep -l -R -i 'keyword' .>/tmp/result.txt  # 列出相应文件路径
#grep -H -R -i 'keyword' .>/tmp/result.txt  # 列出详情和路径
