SKIPUNZIP=0
## Variables
#
# MAGISK_VER (string): the version string of current installed Magisk (e.g. v20.0)
# MAGISK_VER_CODE (int): the version code of current installed Magisk (e.g. 20000)
# BOOTMODE (bool): true if the module is being installed in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module’s installation zip
# ARCH (string): the CPU architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device (e.g. 21 for Android 5.0)
# 

## Function
# ui_print <msg>
#   print <msg> to console
#   Avoid using 'echo' as it will not display in custom recovery's console
# abort <msg>
#   print error message <msg> to console and terminate installation
#   Avoid using 'exit' as it will skip the termination cleanup steps
# set_perm <target> <owner> <group> <permission> [context]
#   if [context] is not set, the default is "u:object_r:system_file:s0"
#   this function is a shorthand for the following commands:
#      chown owner.group target
#      chmod permission target
#      chcon context target
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#   if [context] is not set, the default is "u:object_r:system_file:s0"
#   for all files in <directory>, it will call:
#      set_perm file owner group filepermission context
#   for all directories in <directory> (including itself), it will call:
#      set_perm dir owner group dirpermission context

## print word
REPLACE="
/system/vendor/lib/egl
/system/vendor/lib64/egl
"
ui_print "Kanged latest gpu version from begonia-user-10-QP1A.190711.020-20.6.4 . . ."
ui_print "enjoy . . ."