adb shell ls /storage/103A-B388/DCIM/Camera/*.mp4
if [ "$1" != "" ]; then
  adb pull $1
fi

