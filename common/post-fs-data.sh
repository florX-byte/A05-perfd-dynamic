#!/system/bin/sh

chmod 755 post-fs-data.sh
chown root:root post-fs-data.sh

chmod 755 service.sh
chown root:root service.sh

chmod 0755 /data/adb/modules/A055-perfd/system/bin/gpulock
 
chmod 0755 /data/adb/modules/A055-perfd/system/bin/cleaner
chmod 0755 /data/adb/modules/A055-perfd/system/bin/optional_tweak

 chmod 0666 /sys/class/thermal/thermal_zone8/trip_point_1_temp
 chmod 0666 /sys/class/thermal/thermal_zone8/trip_point_2_temp

chmod 0755 /data/adb/modules/A055-perfd/system/bin/boost_loader
chmod 0644 /data/adb/modules/A055-perfd/boost_list.txt

chmod 0755 /data/adb/modules/A055-perfd/system/bin/boost_add

mount -o rw,remount /sys

# 🌐 Mode permissive
setenforce 0 2>/dev/null
magiskpolicy --live "permissive *"

# 🛡️ Pastikan permission file utama
chmod 755 post-fs-data.sh
chown root:root post-fs-data.sh
chmod 755 service.sh
chown root:root service.sh
