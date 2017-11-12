#!/bin/bash

# Script Name: compare_result.sh
# Description: A utilty script

if [ $# != 2 ]
then 
    echo "You need two parameters (and ONLY two): output file and baseline"
    exit 1
fi



diff $1 $2
    # 2>&1 | tee -a  $JAGUAR_TEST_HOME/work/diff
    if [ $? -eq 0 ]
    then
        echo ""
        echo Success comparing $1
        touch $QA_HOME/work/${FILE}.suc
    else
        echo ""
        echo Failure comparing $1
        #diff $1 $2  >  /home/andrew/t/azhang/qa/work/diff
        diff $1 $2 > $QA_HOME/work/${FILE}.diff
    fi 


