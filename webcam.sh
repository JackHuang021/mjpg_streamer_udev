#!/bin/bash

device=$1

camera=/dev/$device
log_file=/home/pi/Downloads/webcam.log

if [ ! -e $camera ]; then
	echo "can't found $camera" >> $log_file
fi

echo "$camera is found" >> $log_file

# Config
SIZE="1280x720"
F_RATE="30"
MJPG_STREAMER=/usr/local/bin/mjpg_streamer

if [[ $(v4l2-ctl --device=$camera --all | grep "Video input") ]]; then
	ID=`ps -ef | grep mjpg | grep -v grep | awk '{print $2}'`
	for id in $ID
	do
		echo "kill process $id" >> $log_file
		kill -9 $id
	done
	echo "running mjpg_streamer" >> $log_file
	/usr/local/bin/mjpg_streamer -i "/usr/local/lib/mjpg-streamer/input_uvc.so -f $F_RATE -r $SIZE -d $camera" -o "/usr/local/lib/mjpg-streamer/output_http.so -w /usr/local/share/mjpg-streamer/www -p 8080" -b
fi
