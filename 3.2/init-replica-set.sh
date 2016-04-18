# wait until mongo is running
RET=1
while [ $RET -ne 0 ]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

echo "initiating replication set in MongoDB using rs.initiate()"
mongo admin --eval "rs.initiate();"

echo "=> Done!"
