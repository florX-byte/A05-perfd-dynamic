SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

print_modname() {
  ui_print "****************************************"
  ui_print "*     ⚠️  PERINGATAN SEBELUM INSTALL   *"
  ui_print "****************************************"
  ui_print "* Modul ini menonaktifkan thermal,     *"
  ui_print "* meningkatkan frekuensi GPU & CPU.    *"
  ui_print "* Gunakan hanya jika Anda tahu risiko! *"
  ui_print "*                                       *"
  ui_print "* Tekan VOLUME ATAS untuk LANJUT       *"
  ui_print "* Tekan VOLUME BAWAH untuk BATAL       *"
  ui_print "****************************************"
  sleep 1
}

on_install() {
  ui_print "- Menunggu input tombol volume..."
  sleep 1

  # Volume detection
  chooseport() {
    local COUNT=0
    ui_print "- Silakan tekan tombol dalam 3 detik..."
    while [ $COUNT -lt 30 ]; do
      KEY=$(getevent -qlc 1 2>/dev/null | grep "KEY_VOLUME" | awk '{print $3}' | tr -d ']')
      if [ "$KEY" = "KEY_VOLUMEUP" ]; then
        return 0
      elif [ "$KEY" = "KEY_VOLUMEDOWN" ]; then
        return 1
      fi
      sleep 0.1
      COUNT=$((COUNT+1))
    done
    return 1
  }

  chooseport
  if [ $? -eq 0 ]; then
    ui_print "✔️ Melanjutkan instalasi..."
    unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2
  else
    abort "❌ Instalasi dibatalkan oleh pengguna!"
  fi
}

set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
}0644
}