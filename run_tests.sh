#!/bin/bash

# run test and store exit code
exit_code=$((cifuzz run test1 --use-sandbox=false > /cJSON/fuzzing.log 2>&1); echo $?);

# output log file
cat /cJSON/fuzzing.log

# return with original exit code
exit ${exit_code}