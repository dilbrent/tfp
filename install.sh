ls -al android/tflite/app/build/outputs/apk/debug/app-debug.apk
adb install -t -r android/tflite/app/build/outputs/apk/debug/app-debug.apk
adb shell monkey -p com.brenttucker.tflitecam 1

