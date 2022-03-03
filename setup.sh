#!/sbin/sh

###########################
# MMT Reborn Logic
###########################

############
# Config Vars
############

# Uncomment if you want to skip mount for your module
#SKIPMOUNT=true
# Uncomment if you want to clean old files in module before injecting new module
#CLEANSERVICE=true
# Uncomment if you want to load vskel after module info print. If you want to manually load it, consider using load_vksel function
#AUTOVKSEL=true
# Uncomment DEBUG if you want store debug logs of installation
DEBUG=true


############
# Replace List
############

# List all directories you want to directly replace in the system
# Construct your list in the following example format
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"
# Construct your own list here
REPLACE="
"

############
# Cleanup
############

# Remove unnecessary stuff
do_cleanup() {
  rmtouch "$MODPATH/README.md" 
  rmtouch "$MODPATH/xengine.png"
  rmtouch "$MODPATH/XToast.apk"
  rmtouch "$MODPATH/xengine64.tar.xz"
  rmtouch "$MODPATH/xengine32.tar.xz"
  rmtouch "$NVBASE/modules/xengine/engine/busybox"
}

############
# Permissions
############

# Set permissions
set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0777 0755
  set_perm_recursive "$MODPATH/engine" 0 0 0777 0755
  set_perm_recursive "$MODPATH/system/bin" 0 0 0777 0755
  set_perm_recursive "$MODPATH/system/app" 0 0 0777 0755
  set_perm_recursive "$MODPATH/system/vendor/etc" 0 0 0777 0755
  set_perm_recursive "$MODPATH/system/vendor/etc" 0 0 0777 0755
  set_perm_recursive "$MODPATH/system/vendor/etc/perf" 0 0 0777 0755
}

############
# Info Print
############

# Set what you want to be displayed on header of installation process
info_print() {
  awk '{print}' "$MODPATH/xengine_banner"
  ui_print ""
  sleep 0.5
  ui_print "[⚡] ENERGY-AWARE ANDROID OPTIMIZATION AI ENGINE [⚡]"
  ui_print ""
  sleep 0.5
}

############
# Main
############

# Change the logic to whatever you want
int_main() {
  ui_print "[*] Injecting engine into system..."
  ui_print ""
  [[ "$IS64BIT" == "true" ]] && tar -xf "$MODPATH/xengine64.tar.xz" -C "$MODPATH" || tar -xf "$MODPATH/xengine32.tar.xz" -C "$MODPATH"

  sleep 0.5

  for perfconfig in vendor/etc/powerhint.json vendor/etc/powerscntbl.cfg vendor/etc/powerscntbl.xml vendor/etc/perf/commonresourceconfigs.xml vendor/etc/perf/targetresourceconfigs.xml; do
    [[ ! -e "/system/$perfconfig" ]] && rm -rf "$MODPATH/system/$perfconfig"
  done

  ui_print "[*] Setting up executable permissions..."
  ui_print ""

  sleep 0.5

  ui_print "[*] Cleaning up..."
  ui_print ""

  sleep 0.5

  ui_print "[*] Done!"
  ui_print ""

  sleep 1.5

  ui_print " --- Notes --- "
  ui_print ""
  ui_print "[*] Reboot is required"
  ui_print ""
  ui_print "[*] Do not use XEngine™ with other optimizer modules"
  ui_print ""
  ui_print "[*] (su -c xmenu) to open XMenu™ in Terminal"
  ui_print ""
  ui_print "[*] Report issues to @loopchats on Telegram"
  ui_print ""
  ui_print "[*] Join @loopprojects on Telegram to get XEngine™ updates"
  ui_print ""
  ui_print "[*] You can find me at iamloooper @ Telegram for direct support"

  sleep 2.5
}