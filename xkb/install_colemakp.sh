#!/usr/bin/env zsh
# usage: zsh install_colemakp.sh install / uninstall
if [[ $1 == "install" ]]; then
    echo "installing colemakp"
    sudo mv /usr/share/X11/xkb/symbols/us ~/runtime_config/xkb/us_backup
    sudo cp ~/dkenv/runtime_config/xkb/usr-share-X11-xkb-symbols-us_colemakp_manjaro_1907 \
        /usr/share/X11/xkb/symbols/us
elif [[ $1 == "uninstall" ]]; then
    echo "uninstalling colemakp"
    sudo rm /usr/share/X11/xkb/symbols/us
    sudo mv ~/dkenv/runtime_config/xkb/us_backup /usr/share/X11/xkb/symbols/us

else
    echo "type install/uninstall"
fi
