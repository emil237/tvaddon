#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emilnabil/tvaddon/main/installer.sh -O - | /bin/sh
#
echo " download and install plugin tv addon panel "

version=2.0.7
OPKGINSTALL=opkg install --force-overwrite
MY_URL="https://raw.githubusercontent.com/emilnabil/tvaddon/main"
MY_IPK="enigma2-plugin-extensions-tvaddon_2.0.7_all.ipk"
MY_DEB="enigma2-plugin-extensions-tvaddon_2.0.7_all.deb"
##############################################################################
# remove old emu #
opkg remove enigma2-plugin-extensions-tvpanel 

rm -rf /usr/lib/enigma2/python/Plugins/Extensions/tvPanel/

#################################################################################

# Remove previous files #
cd /tmp
rm -rf * > /dev/null 2>&1

# Download and install plugin #

set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		opkg install --force-reinstall $MY_IPK
	fi
echo "================================="
set +e
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
		echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0



































