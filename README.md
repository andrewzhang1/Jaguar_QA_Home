## Instruction on Running automated test for jaguar database
Updated by Andrew Zhang, 
#### 11/10/2017 
### (Draft)

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
 
 
 
### Note: Run tes on Windows
#### If Installed MSYS-1.0.11.exe on windows and set system enviroment variable correctly, we should be able to run the same test on windows as well; however, we currenty encounted a permission issues

For example, we can set a .bash_profile on the home directory on windows:

#### 1)  Set env for jaguar and QA testing
export JAGUAR_HOME=/c/AGZ1/jaguar-enterprise-2.8.2
export QA_HOME=/c/AGZ1/jaguar_QA_HOME
export PATH="$QA_HOME/bin":"$JAGUAR_HOME/bin":$PATH

alias qa='cd $QA_HOME'
alias jaguar='cd $JAGUAR_HOME'

#### 2) Down load the test framework from github:
/home/Andrew
(Andrew@AZHANG1)\>git clone https://github.com/andrewzhang1/Jaguar_QA_Home.git

#### 3) Run the test at:



 /c/AGZ1/jaguar_QA_HOME/bin
(Andrew@AZHANG1)\>ls -l
total 87
-rwxr-xr-x 1 Andrew Administrators   575 Nov 10 20:23 compare_result.sh
-rw-r--r-- 1 Andrew Administrators 86368 Nov 10 20:23 diff
-rw-r--r-- 1 Andrew Administrators   273 Nov 10 20:23 loginj

/c/AGZ1/jaguar_QA_HOME/bin
(Andrew@AZHANG1)\>which loginj
which: loginj: unknown command

/c/AGZ1/jaguar_QA_HOME/bin
(Andrew@AZHANG1)\>which jag
/c/AGZ1/jaguar-enterprise-2.8.2/bin/jag

/c/AGZ1/jaguar_QA_HOME/bin
(Andrew@AZHANG1)\>ls -l /c/AGZ1/jaguar-enterprise-2.8.2/bin/jag
-rwxr-xr-x 1 Andrew Administrators 303 Oct 31 18:20 /c/AGZ1/jaguar-enterprise-2.8.2/bin/jag

/c/AGZ1/jaguar_QA_HOME/bin
(Andrew@AZHANG1)\>

