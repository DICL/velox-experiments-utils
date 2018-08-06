#!/bin/bash

/home/vicente/opt/hadoop-2.7.3/sbin/stop-yarn.sh

sleep 3
eclipsed kill

/home/vicente/opt/hadoop-2.7.3/sbin/start-yarn.sh

/home/vicente/drop_caches
sleep 15

eclipsed restart

pdsh -w raven[01-39] -x raven20,raven09 /home/vicente/drop_caches

sleep 60

cd /home/vicente/opt/hadoop-2.7.3
#sh run_wc.sh 2>&1 | tee ~/last-mr-output.out
sh run_awc.sh 2>&1 | tee ~/last-mr-output.out
