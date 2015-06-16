#!/bin/bash

# Run the local reload script
bash ~/reload-local-config.sh

# copy the local config out to doorbot2
echo "copying config to doorbot2"
scp logcards/config.yaml doorbot2:/home/pi/logcards

# copy over any custom "ringtone" files
rsync -avz --delete logcards/wav/ doorbot2:/home/pi/logcards/wav

# and run the remote reload script
echo "reloading on doorbot2"
ssh doorbot2 './reload-local-config.sh'

# copy the local config out to doorbot3
echo "copying config to doorbot3"
scp logcards/config.yaml doorbot3:/home/pi/logcards

# copy over any custom "ringtone" files
rsync -avz --delete logcards/wav/ doorbot3:/home/pi/logcards/wav

# and run the remote reload script
echo "reloading on doorbot3"
ssh doorbot3 './reload-local-config.sh'
