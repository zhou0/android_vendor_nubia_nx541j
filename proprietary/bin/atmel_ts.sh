#!/system/bin/sh

#sleep 2

#insmod /data/temp/mxt.ko

cd /sys/bus/i2c/devices/0-004a

chown root:root *
chmod 777 *
echo "A6_06_1.1_AA.fw" > update_fw0
echo "A6_06.raw" > update_cfg

#send self tune command for 540s
#0 : no backup
#1 : backup
#echo 0 > self_tune
dmesg > /cache/atmel_ts.log

sleep 1

#enable plugin
#
#format: pl enable [hex]
#[0] : CAL
#[1] : MSC
#[2] : PI
#[3] : CLIP 
#[4] : WDG 
#[7] : PLUG PAUSE
#echo "pl enable 2" > plugin

#PTC auto tune (should enable MSC above,sleep 5s for tune complete)
#[0] : tune not store
#[1] : tune and store
#[2] : re-tune and not store
#[3] : re-tune and store
#[other value] : report tune status 
#echo "msc ptc tune 1" > plugin
#sleep 7

#set gesture list
#format: <name> <val>;<name> <val>;...
#you could run command "cat gesture_list" for current config list
#<val>: bit[0]: enable
#	bit[1]: disable, 
#	bit[3]  status (1: excuted)
#echo "TAP 1;UNLOCK0 1;UNLOCK1 1;" > gesture_list
#echo "TAP 1" > gesture_list

#enable gesture feature
#echo 0 > en_gesture

#zte add
#echo "clp cl area[0]: 0,0 33,1920" > plugin
#echo "clp cl area[1]: 0,0 1080,0" > plugin
#echo "clp cl area[2]: 1046,0 1080,1920" > plugin
#echo "clp cl area[3]: 0,1920 1080,1920" > plugin
#echo "clp cl dist: 0,300" > plugin
echo "clp pa numtch: 0" > plugin
echo "clp pa thld: 50 20 0 20" > plugin
echo "clp enable 1" >  plugin
#echo "wd enable 3" > plugin
#zte end

echo "pl enable e" > plugin

#chmod 440 t19
#chmod 440 update_cfg
#chmod 440 update_fw

