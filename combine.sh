#!/bin/sh

PID=$(adb shell pidof $1)

if [ "$2" = "" ] ; then
    TWO="-"
else
    TWO=$2
fi

if [ "$3" = "" ] ; then
    THREE="-"
else
    THREE=$3
fi

./slickr.sh $1 $TWO $THREE "cat" > temp.txt

adb shell echo \$EPOCHREALTIME
# echo "--------- beginning of main"
# adb logcat -d | awk -v pid="$PID" '$3 == pid {print($0)}' | grep "Perf:GraywaterTimelineAdapter"
adb logcat -d -v threadtime

# adb logcat -d | awk -v pid="$PID" '$3 == pid {print($0)}'

echo "$(<temp.txt)"

rm temp.txt