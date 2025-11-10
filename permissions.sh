#!/bin/sh

package="com.carriez.flutter_hbb"
adb shell appops set $package PROJECT_MEDIA allow
adb shell appops set $package POST_NOTIFICATION allow
adb shell pm grant $package android.permission.POST_NOTIFICATIONS
adb shell dumpsys deviceidle whitelist +$package
adb shell settings put global zen_mode 0
adb shell settings put secure enabled_accessibility_services $package/$package.InputService
adb shell pm grant $package android.permission.SYSTEM_ALERT_WINDOW
adb shell appops set $package SYSTEM_ALERT_WINDOW allow
adb shell appops set $package MANAGE_EXTERNAL_STORAGE allow
adb shell am start -a android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION -d package:$package
adb shell pm grant $package android.permission.RECORD_AUDIO
adb shell pm grant $package android.permission.FOREGROUND_SERVICE
adb shell pm grant $package android.permission.FOREGROUND_SERVICE_MICROPHONE
adb shell pm grant $package android.permission.CAMERA
adb shell monkey -p $package -c android.intent.category.LAUNCHER 1
