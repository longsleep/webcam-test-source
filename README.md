# Test web cam or muliple web cams

For testing, a Linux Kernel module is required which emulates video4linux
devices which then can be fed with data and used line a web cam by applications.

## Video4Linux emulator loopback

Download, build and install by following instructions from 
https://github.com/umlaeute/v4l2loopback and then start a bunch of devices

```
sudo modprobe v4l2loopback devices=2
```

Examples: https://github.com/umlaeute/v4l2loopback/wiki

## GStreamer

With GStreamer it is very easy to feed data into the emulated devices.

### Send video test data 

```
gst-launch-1.0 videotestsrc ! v4l2sink device=/dev/video2
```

### View data stream

Also with the help of GStreamer it is very easy to show whats going on with
a video4linux device.

```
gst-launch-1.0 v4l2src device=/dev/video2 ! xvimagesink
```

## Usage

This project contains a `./run.sh` file which can be used for simple testing.
