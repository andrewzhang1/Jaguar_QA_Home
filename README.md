Updated by Andrew Zhang, 2015/08/28 

Jaguar database automation enables automated test cases with minimum manual operation. 
After we successfully download and install a jaguar build, we can run this test
as an acceptance test, which covers most of the basic sql syntax.

Here are a few requirement and dependencies  
1) Need a successful installation (take sample on andrew@ssd, 14 nodes); make sure sure all server started/stopped without errors 
2) System environment settings requires: 
JAGUAR_HOME 
QA_HOME 
And some PATH settings, for example (on andrew@ssd): 
 
export JAGUAR_HOME=/home/$LOGNAME/jaguar 
export QA_HOME=/home/andrew/t/azhang/qa 
export PATH=$QA_HOME/bin:$QA_HOME/sh:$JAGUAR_HOME/bin:$PATH 
 
3) We should be able run test cases from anywhere on the server where we have test cases downloaded; however, it's easier to kick out the test from 
$QA_HOME/sh 
Step 1: run import_export_sql.sh 
/home/andrew/t/azhang/qa/sh 
(andrew@ssd)\>import_export_sql.sh 
 
Step 2: Check result: 
/home/andrew/t/azhang/qa/work 
(andrew@ssd)\>ls *.suc | wc 
      2       2      57 
  
/home/andrew/t/azhang/qa/work 
(andrew@ssd)\>ls *.diff | wc 
ls: cannot access *.diff: No such file or directory 
      0       0       0 
 
If no *.diff files found, we regard the automation are successful. 


Other Notes: 
Each test case (automation script) is independent from each other, which means that we can run each one individually, or in the a group. Some pro and con: 
Pro: 
Able to run individually and not interfere each other 
We can pick any one for a particular purpose  
Con: 
Some of the the setup is duplicated, which might take some extra time to run the automation. 
 
 
