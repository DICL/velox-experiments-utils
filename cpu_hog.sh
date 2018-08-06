pdsh -N -w raven[01-39] -x raven20 'stress -c $(( $RANDOM % 8 )) &'
