#! /bin/sh

if [ ! -d "/data/tp" ]; then
    mkdir /data/tp
    chmod 0775 /data/tp
    chown system:system /data/tp
else
    rm /data/tp/*
fi

# ==============================================================================
# Atmel

if [ -e "/sys/bus/i2c/devices/0-004a/plugin_tag" ]; then
	ln -s /sys/bus/i2c/devices/0-004a/plugin_tag /data/tp/ic_ver
fi

if [ -e "/sys/bus/i2c/devices/0-004a/plugin_tag_uid" ]; then
	ln -s /sys/bus/i2c/devices/0-004a/plugin_tag_uid /data/tp/uid
fi

if [ -e "/sys/bus/i2c/devices/0-004a/easy_wakeup_gesture" ]; then
	chown system:system /sys/bus/i2c/devices/0-004a/easy_wakeup_gesture
	ln -s /sys/bus/i2c/devices/0-004a/easy_wakeup_gesture /data/tp/easy_wakeup_gesture
fi

if [ -e "/sys/bus/i2c/devices/0-004a/slide_switch_gesture" ]; then
	chown system:system /sys/bus/i2c/devices/0-004a/slide_switch_gesture
	ln -s /sys/bus/i2c/devices/0-004a/slide_switch_gesture /data/tp/slide_switch_gesture
fi

if [ -e "/sys/bus/i2c/devices/0-004a/plugin" ]; then
	chown system:system /sys/bus/i2c/devices/0-004a/plugin
	ln -s /sys/bus/i2c/devices/0-004a/plugin /data/tp/plugin
fi

if [ -e "/sys/bus/i2c/devices/0-004a/ic_detect" ]; then
	ln -s /sys/bus/i2c/devices/0-004a/ic_detect /data/tp/ic_detect
fi

if [ -e "/sys/bus/i2c/devices/0-004a/manual_cali" ]; then
	ln -s /sys/bus/i2c/devices/0-004a/manual_cali /data/tp/manual_cali
fi

if [ -e "/sys/bus/i2c/devices/0-004a/touch_mode" ]; then
	chown system:system /sys/bus/i2c/devices/0-004a/touch_mode
	ln -s /sys/bus/i2c/devices/0-004a/touch_mode /data/tp/touch_mode
fi

# ==============================================================================
#focaltech

if [ -e "/sys/bus/i2c/devices/0-0038/ftstpfwver" ]; then
        ln -s /sys/bus/i2c/devices/0-0038/ftstpfwver /data/tp/ic_ver
fi

if [ -e "/sys/bus/i2c/devices/0-0038/easy_wakeup_gesture" ]; then
        chown system:system /sys/bus/i2c/devices/0-0038/easy_wakeup_gesture
        ln -s /sys/bus/i2c/devices/0-0038/easy_wakeup_gesture /data/tp/easy_wakeup_gesture
fi

if [ -e "/sys/bus/i2c/devices/0-0038/ic_detect" ]; then
        ln -s /sys/bus/i2c/devices/0-0038/ic_detect /data/tp/ic_detect
fi

# ==============================================================================
#gt1151

if [ -e "/sys/gt1x_test/gtpfwver" ]; then
        ln -s /sys/gt1x_test/gtpfwver /data/tp/ic_ver
fi

if [ -e "/sys/gt1x_test/openshort" ]; then
        chown system:system /proc/gmnode031072
        ln -s /sys/gt1x_test/openshort /data/tp/hd_ic_detect
fi
# ==============================================================================
# Synaptics

if(ls /sys/bus/i2c/devices/0-0020/input/input*/ic_ver) > /dev/null 2>&1; then
	ln -s /sys/bus/i2c/devices/0-0020/input/input*/ic_ver /data/tp/ic_ver
fi

if(ls /sys/bus/i2c/devices/0-0020/input/input*/reset) > /dev/null 2>&1; then
	ln -s /sys/bus/i2c/devices/0-0020/input/input*/reset /data/tp/reset
fi

if(ls /sys/bus/i2c/devices/0-0020/input/input*/wake_gesture) > /dev/null 2>&1; then
	chown system:system /sys/bus/i2c/devices/0-0020/input/input*/wake_gesture
	ln -s /sys/bus/i2c/devices/0-0020/input/input*/wake_gesture /data/tp/easy_wakeup_gesture
fi

if(ls /sys/bus/i2c/devices/0-0020/input/input*/palm_sleep) > /dev/null 2>&1; then
	chown system:system /sys/bus/i2c/devices/0-0020/input/input*/palm_sleep
	ln -s /sys/bus/i2c/devices/0-0020/input/input*/palm_sleep /data/tp/easy_sleep_palm
fi

if [ -e "/sys/bus/i2c/devices/0-0020/touch_mode" ]; then
	chown system:system /sys/bus/i2c/devices/0-0020/touch_mode
	ln -s /sys/bus/i2c/devices/0-0020/touch_mode /data/tp/touch_mode
fi

if(ls /sys/bus/i2c/devices/0-0020/input/input*/f54/ic_detect) > /dev/null 2>&1; then
	chown system:system /sys/bus/i2c/devices/0-0020/input/input*/f54/ic_detect
	ln -s /sys/bus/i2c/devices/0-0020/input/input*/f54/ic_detect /data/tp/ic_detect
fi

if(ls /sys/bus/i2c/devices/0-0020/input/input*/start_update) > /dev/null 2>&1; then
	chown system:system /sys/bus/i2c/devices/0-0020/input/input*/start_update
	ln -s /sys/bus/i2c/devices/0-0020/input/input*/start_update /data/tp/start_update
	cat /sys/bus/i2c/devices/0-0020/input/input*/start_update
fi
