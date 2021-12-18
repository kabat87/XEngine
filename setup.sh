#!/sbin/sh
###########################
# MMT Bourne Setup Script
###########################

############
# Config Vars
############

# Uncomment if you want to skip mount for your module
# Uncomment if you want to clean old files in module before injecting new module
# Uncomment if you want to load vskel after module info print. If you want to manually load it, consider using load_vksel function
# Uncomment DEBUG if you want full debug logs (Saved To Internal Storage)
#SKIPMOUNT=true
CLEANSERVICE=true
#AUTOVKSEL=true
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
do_cleanup(){
  rm -rf "$MODPATH/LICENSE" 2>/dev/null
  rm -rf "$MODPATH/README.md" 2>/dev/null
  rm -rf "$MODPATH/xengine.png" 2>/dev/null
  rm -rf "$MODPATH/XToast.apk" 2>/dev/null
  rm -rf "$MODPATH/xengine64.tar.xz"
  rm -rf "$MODPATH/xengine32.tar.xz"
}

############
# Permissions
############

# Set permissions
set_permissions(){
  set_perm_recursive "$MODPATH" 0 0 0777 0755
  set_perm_recursive "$MODPATH/engine" 0 0 0777 0755
  set_perm_recursive "$MODPATH/system/bin" 0 0 0777 0755
}

############
# Info Print
############

# Set what you want to be displayed on header of installation process
info_print(){
  awk '{print}' "$MODPATH/xengine_banner"
  ui_print ""
  ui_print "[⚡] ENERGY-AWARE ANDROID OPTIMIZATION AI ENGINE [⚡]"
  ui_print ""
  sleep 1.5
}

############
# Main
############

# Change the logic to whatever you want
int_main(){
  ui_print "[*] Injecting engine into system... "
  ui_print ""
  if [[ "$IS64BIT" == "true" ]]; then
    tar -xf "$MODPATH/xengine64.tar.xz" -C "$MODPATH"
  else
    tar -xf "$MODPATH/xengine32.tar.xz" -C "$MODPATH"
  fi 
  pm install "$MODPATH/XToast.apk"
  sleep 1.5
  ui_print "[*] Setting up executable permissions... "
  sleep 1
  ui_print ""
  ui_print "[*] Cleaning up... "
  ui_print ""
  sleep 1
  ui_print "[*] Done!"
  ui_print ""
  sleep 1.5
  ui_print " --- Notes --- "
  ui_print ""
  ui_print "[*] Reboot is required"
  ui_print ""
  ui_print "[*] Do not use XEngine™ with other optimizer modules"
  ui_print ""
  ui_print "[*] (su -c xmenu) to open XMenu™ in Termux"
  ui_print ""
  ui_print "[*] Report issues to @tweak_projects_discuss on Telegram"
  ui_print ""
  ui_print "[*] You can find me at iamlooper @ Telegram for direct support"
  sleep 4
}