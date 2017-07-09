#!/bin/sh

set -ex

sudo modprobe v4l2loopback devices=2

DEVICE=/dev/video2

# See https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-plugins-base-plugins/html/gst-plugins-base-plugins-videotestsrc.html#GstVideoTestSrcPattern
PATTERN=smpte
#PATTERN=snow
#PATTERN=ball
#PATTERN=pinwheel

RESOLUTION="video/x-raw,width=(int)640,height=(int)480,framerate=(fraction)20/1,format=(string)YUY2"

exec gst-launch-1.0 videotestsrc pattern=$PATTERN ! "$RESOLUTION" ! v4l2sink device=$DEVICE


