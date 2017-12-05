#!/bin/bash

#: Script Name: data_load.sh
#: Authors: Andrew Zhang
#: Reviewers:
#: Date: 10/17/2017
#: Purpose:     Basic funtion to load data in a new database.
#: Test cases:
#       Use case 1:
#       -------------------------------------------------------------------
#
#: Component/Sub Comp:
#: Owned by: Andrew Zhang
#: Reviewed by:
#: Tag:
#: Dependencies: 
#: Runnable: true
#: Arguments: none
#: Memory/Disk: 200MB/200MB
#: SUC:  1
#: Created for:
#: Retired for:
#: Test time: within 10 sec
#: History:

# 12/4/2017 Andrew Zhang
#           Added test cases after the fix of bug 033 for version 2.8.3.1.1.1

# Test Name: dataLoad.sh  
# Test select:


# Need two system environments:
# JAGUAR_HOME and QA_HOME  


FILE=data_load

FILE=data_load
FILE2=data_load2

PORT=`cat $HOME/jaguar/conf/server.conf |grep PORT|grep -v oport|grep -v '#'|cut -d= -f2`
HOST=127.0.0.1
USER=admin
PASSWORD=jaguar


function compare_result 
{
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
         diff $1 $2 > $QA_HOME/work/${FILE}.diff
    fi
}

logf="$QA_HOME/work/${FILE}.log"

#clean old log
if [ -f $logf ]
    then rm $logf
fi

$JAGUAR_HOME/bin/jag  -u $USER -p $PASSWORD  -h $HOST:$PORT -v yes < $QA_HOME/sql/${FILE}1.sql 2>&1 | tee -a $logf

compare_result  $QA_HOME/work/${FILE}1.out  $QA_HOME/bas/${FILE1}1.bas 2>&1 | tee -a $logf

