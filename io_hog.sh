#!/bin/bash

set -x
# 1/3 chance to be 1
#pdsh -N -w raven[01-39] -x raven20,raven09 '(cd /scratch/vicente; LUCKY=$(( $RANDOM % 3 == 0)); stress -d $LUCKY -i $LUCKY --hdd-bytes 6710886)' 
pdsh -N -w raven[01-30] -x raven20,raven09 '(cd /scratch/vicente; LUCKY=$(( $RANDOM % 3 == 0)); stress -d $LUCKY)' 

set +x
