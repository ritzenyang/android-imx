#! /vendor/bin/sh

#########################################
### init.insmod.cfg format:           ###
### --------------------------------- ###
### [insmod|setprop] [path|prop name] ###
### ...                               ###
#########################################

cfg_file="/vendor/etc/init.insmod.cfg"

if [ -f $cfg_file ]; then
  while IFS=" " read -r action name value
  do
    case $action in
      "insmod") insmod $name ;;
      "setprop") setprop $name $value ;;
    esac
  done < $cfg_file
fi

# set property even if there is no insmod config
# as property value "1" is expected in early-boot trigger
setprop sys.all.modules.ready 1
