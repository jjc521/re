#!/bin/bash
FILE=`find ~/Go_WorkSpace/src/github.com/cockroachdb/cockroach/pkg/sql -name "*.go"`

for file in $FILE
do
        sed -ne '/^import (/,/)$/p' $file >> temp2.txt    #匹配形如 "import (.....) 多行匹配,"
        sed -n '/import [a-z]* "/p' $file >> temp2.txt
        sed -n '/package /p' $file >> temp3.txt
done
