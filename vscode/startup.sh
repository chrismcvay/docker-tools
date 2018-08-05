#!/bin/bash

# Start Visual Studio code
/usr/bin/code "$@"
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start Visual Studio Code: $status"
  exit $status
fi

while sleep 10; do
  ps aux |grep code |grep -q -v grep
  PROCESS_1_STATUS=$?

  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0  ]; then
    echo "Don't see Visual Studio Code running any more."
    exit 1
  fi
done


