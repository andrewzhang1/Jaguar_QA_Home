#!/bin/bash

#: Script Name: jaguar_test_main.sh
#: Authors: Andrew Zhang
#: Reviewers: 
#: Date: 09/19/2017
#: Purpose:     Batch control datajaguar's regression tests.
#: Test cases: 
#       Use case 1: 
#       -------------------------------------------------------------------
#
#: Component/Sub Comp: 
#: Owned by: 
#: Tag: 
#: Dependencies: sql scriptscilab, python, etc
#: Runnable: true
#: Arguments: none
#: Memory/Disk: 200MB/200MB
#: SUC: 
#: Created for: 
#: Retired for:
#: Test time: within 10 sec
#: History:

# Note: In order to run test, we need to set the following system variables: 
# 1. QA_HOME 
# 2. JAGUAR_HOME 
# 3. ADMIN_PASSWORD 
# 

export ADMIN_PASSWORD=jaguar

FILE=jaguar_test_main
logf="$JAGUAR_TEST_HOME/work/${FILE}.log"

# Clean old log:
if [ -f $logf ]
    then rm $logf
fi

echo "Runing select1.sh" 2>&1 | tee -a $logf
echo "==================="  2>&1 | tee -a $logf
echo "" 2>&1 | tee -a $logf

select1.sh 2>&1 | tee -a $logf


echo ""  2>&1 | tee -a $logf
echo "Runing select2.sh now " 2>&1 | tee -a $logf
echo "=================++++=="  2>&1 | tee -a $logf

select2.sh 2>&1 | tee -a $logf


