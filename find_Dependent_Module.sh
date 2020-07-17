#!/bin/bash
#获得SQL层的依赖项
 
FILE=`find ~/Go_WorkSpace/src/github.com/cockroachdb/cockroach/pkg/sql -name "*.go"`    #找到查询文件
 
for file in $FILE
do
          sed -n '/^import (/,/)$/p' $file >> temp2.txt           #匹配多行导入
          sed -n '/import [a-z]* "/p' $file >> temp2.txt          #匹配单行导入
          sed -n '/package /p' $file >> temp3.txt                 #匹配pacakge
done
  
 cat temp2.txt | cut -d '"' -f2 | sed -n '/^[a-z|A-Z]/p' | sed -n '/[a-z|A-Z|0-9]$/p' > temp1.txt        #获取 “” 内的内容
 sort -k2n temp1.txt | sed '$!N; /^\(.*\)\n\1$/!P; D' > temp.txt         # 去除重复的行
 
 rm temp1.txt temp2.txt         #删除中间文件

