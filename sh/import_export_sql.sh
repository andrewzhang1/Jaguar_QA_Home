#!/bin/bash

#: Script Name: import_export_sql.sh
#: Authors: Andrew Zhang
#: Reviewers: 
#: Date: 10/16/2017
#: Purpose:     Data import export for feature of jagexportsql and jagimportsql
#: Test cases: 
#       Use case 1: 
#       -------------------------------------------------------------------
#
#: Component/Sub Comp: 
#: Owned by: Andrew Zhang 
#: Reviewed by:
#: Tag: 
#: Dependencies: QA_HOME framework and loginj 
#: Runnable: true
#: Arguments: none
#: Memory/Disk: 200MB/200MB
#: SUC:  2
#: Created for: 
#: Retired for:
#: Test time: within 10 sec
#: History:

# Note: In order to run test, we need to set two 
# 

FILE=import_export_sql
logf="$QA_HOME/work/${FILE}.log"

# 
export ADMIN_PASSWORD=jaguar

# Clean old log:
if [ -f $logf ]
    then mv $logf ${logf}_old
fi

# Clean up the database and log files
jaguarstop_on_all_hosts.sh  2>&1 | tee -a $logf 

jaguarstart_on_all_hosts.sh 2>&1 | tee -a $logf 

# 1.Create table and load data
echo -e "\n1. Create table and load data"  2>&1 | tee -a $logf
echo -e "============================== \n"  2>&1 | tee -a  $logf
loginj < $QA_HOME/sql/import_export_sql.sql  2>&1 | tee -a $logf 

sleep 15 

# 2. Test  jagexportsql & jagimportsql
#######################################

# 2-1 export by jagexportsql
echo -e "\n\n2-1. export by jagexportsql...\n"  2>&1 | tee -a $logf
echo -e "============================== \n"  2>&1 | tee -a $logf 

jagexportsql -d test -t test.import_export -f $QA_HOME/work/test.import_export.sql 2>&1 | tee -a $logf
echo "Runng jagexportsql...then sleep 15 sec."

sleep 15 

# 2-2. Clean data

echo -e "\n2-2. Clean data..."  2>&1 | tee -a $logf
echo -e "============================== \n"  2>&1 | tee -a $logf 

loginj < $QA_HOME/sql/import_export-clean_data.sql 2>&1 | tee -a $logf

# 2-3. Import by jagimportsql
echo -e "\n\n2-3. Import by jagimportsql..."  2>&1 | tee -a $logf
echo -e "============================== \n"  2>&1 | tee -a $logf 

jagimportsql -d test -t test.import_export -f $QA_HOME/work/test.import_export.sql 2>&1 | tee -a $logf
echo "Running jagimportsql...sleep 30..."

sleep 30

# 2-4. Check Correctness 
echo -e "\n2-4. Check Correctness..."  2>&1 | tee -a $logf
echo -e "============================== \n"  2>&1 | tee -a $logf 

# check the row count before we check the select count from each server

loginj < $QA_HOME/sql/import_export-verification.sql 2>&1 | tee -a $logf 2>&1 | tee -a $logf

sshall grep selectcount $JAGUAR_HOME/log/jaguar.log 2>&1 | tee -a $QA_HOME/work/importsql_selectcount.out 2>&1 | tee -a $logf


# 2-5. Compare results
echo -e "\n\n2-5. Compare results "  2>&1 | tee -a $logf
echo -e "================================ "  2>&1 | tee -a $logf
# compare import_export.sql.out
export FILE=import_export_sql
compare_result $QA_HOME/work/${FILE}.out $QA_HOME/bas/${FILE}.bas  2>&1 | tee -a $logf 

# Compapare  import_export-verification.out
export FILE=import_export-verification_sql
compare_result $QA_HOME/work/${FILE}.out $QA_HOME/bas/${FILE}.bas  2>&1 | tee -a $logf


echo "End of test import_export_sql.sh" 2>&1 | tee -a $logf



