### mjpg_streamer udev script for raspberry pi

#### Description
raspberry pi 2B has a usb randomly reconnect problem, add a udev script to check usb video device and restart mjpg_stream, is very userful for octoprint

##### How To Use
1. install mjpg_streamer, see [mjpg_streamer repo](https://github.com/jacksonliam/mjpg-streamer)
2. copy 99-video.rules and webcam.sh to /etc/udev/rules.d/ directory
3. restart raspberry pi and plug in usb camera
