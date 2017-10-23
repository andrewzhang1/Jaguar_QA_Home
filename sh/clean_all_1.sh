#hs=`./gethosts.sh`

hs=$JAGUAR_HOME/conf/cluster.conf

cat $JAGUAR_HOME/conf/cluster.conf |
while read line
do
    ssh $line "ls -l  $JAGUAR_HOME/data/"
    echo "hi"
done

echo "done with cleaning"
