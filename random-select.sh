#!/bin/env bash

#随机选择一个文件行
FILE_NAME=$1

if [ -z "$FILE_NAME" ]; then
    echo "empty file name!"
    exit 1
fi

TOTAL_LINE="$(wc -l "${FILE_NAME}"|awk '{print $1}')"

RANDOM_NUMBER=$RANDOM

SELECTED_LINE_NUMBER="$(((RANDOM_NUMBER%TOTAL_LINE)+1))"

SED_ARGS="-n ${SELECTED_LINE_NUMBER}p"

SELECTED_LINE="$(sed -n $SED_ARGS $FILE_NAME)"


#echo "$FILE_NAME $TOTAL_LINE lines, random: $RANDOM_NUMBER, SELECTED_LINE_NUMBER: $SELECTED_LINE_NUMBER"

echo "SELECTED_LINE: ${SELECTED_LINE_NUMBER}"
echo $SELECTED_LINE
