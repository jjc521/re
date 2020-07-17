#!/bin/bash
FILE=`find ~/Go_WorkSpace/src/github.com/cockroachdb/cockroach/pkg/sql -name "*.go"`  #路径换成要匹配文件夹的命令

for file in $FILE
do
#匹配形如 "import (.....) 多行匹配"
#匹配两个关键字之间的行 格式： sed -n '/^adm/,/^mysql/p' $为结尾
        sed -ne '/^import (/,/)$/p' $file >> temp2.txt    
        sed -n '/import [a-z]* "/p' $file >> temp2.txt
        sed -n '/package /p' $file >> temp3.txt
done
