#!/system/bin/sh
# XEngine™ | Service Script

modpath="/data/adb/modules/xengine/"

wait_until_login() {
  # In case of /data encryption is disabled
  while [[ "$(getprop sys.boot_completed)" != "1" ]]; do
      sleep 2
  done

  # We don't have the permission to rw "/storage/emulated/0" before the user unlocks the screen
  local test_file="/storage/emulated/0/Android/.PERMISSION_TEST"
  true > "$test_file"
  while [[ ! -f "$test_file" ]]; do
    true > "$test_file"
    sleep 1
  done
  rm -f "$test_file"
}

wait_until_login

# Sleep some time to complete init
sleep 60

# Run XEngine™
("${modpath}engine/xengine4" &)& 2>/dev/null
("${modpath}engine/xengine5" &)& 2>/dev/null