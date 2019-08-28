#!/bin/bash

## USAGE: ./run.sh <rep>
## provide a numeric <rep> as the first and only argument to this script

RUN=$1

RCMD1="runName <- paste0('LandWeb_highDispersal_logROS_rep', SpaDES.core::paddedFloatToChar(${RUN}, padL = 2));"
RCMD2="source('newStart.R')"

RCMDS="${RCMD1} ${RCMD2}"

until [ -f "mySimOut_1000.rds" ]
do
echo ${RCMDS} | r
done