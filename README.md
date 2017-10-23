Updated by Andrew Zhang, 2015/08/28 

After we successfully download and install a jaguar build, we can run this test
as an acceptance test, which covers most of the basic sql syntax.

Notes:  
1) Download all the above files and folder into your local file system;

2) Please copy the data folder jaguarTestData into the your home directory $HOME, so the 
jaguarFunc.sq will load data properly. For example, make sure to see this:

(azhang@vmlxU2)\>ls -l $HOME/jaguarTestData/10kLine.txt
-rwxr-xr-x 1 azhang azhang 680353 Aug 16 02:23 /home/azhang/jaguarTestData/10kLine.txt

3) On the command line, run: "./jaguarMainFunc.sh", after test, you will see  
a log file with a time stamp attached like this one: 
"jaguarFunc_sql_20150831_101300.log"
