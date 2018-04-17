# Raspberry PI flashing

1. Download Raspbian Lite and extract it
1. `diskutil list`, find the card
1. `diskutil unmountDisk /dev/disk2`
1. `sudo dd bs=1m if=path-to-image of=/dev/rdisk2`
1. Add `dtoverlay=dwc2` to the bottom of config.txt
1. Add an empty file named `ssh`
1. Add `modules-load=dwc2,g_ether` after `rootwait` in cmdline.txt

💥
