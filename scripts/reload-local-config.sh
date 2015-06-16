#!/bin/bash

echo "Reloading config.yaml"
sudo kill -HUP $( ps auxww | grep 'ruby logcards' | grep -v grep | awk '{print $2}' )
