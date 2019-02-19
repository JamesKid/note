#!/bin/sh
sed -i '/VB/'d `grep -l -R -i 'vbs' .`
