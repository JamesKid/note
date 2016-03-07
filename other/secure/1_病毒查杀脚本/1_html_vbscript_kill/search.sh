#!/bin/sh
grep -H -R -i 'vbs' * | grep 'html' > /tmp/result.txt  # 过滤含有vbs 的html
