#!/system/bin/sh
MODDIR=${0%/*}

# Performance Module para MediaTek G80/G85/G88/G91 (Samsung A05)
# Optimized & Fully Integrated Version

# ==============================================================================
# GERBANG PEMERIKSA BOOT - Menahan Skrip Sampai Sistem Benar-benar Siap
# ==============================================================================
# Loop akan terus berjalan selama properti boot_completed belum bernilai 1
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    bash /system/bin/optional_tweak
done

sleep 10
service call SurfaceFlinger 1008 i32 1
service call SurfaceFlinger 1022 f 1.3
