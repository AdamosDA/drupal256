#!/bin/bash
usage()
{
cat << EOF
usage: $0 options

This script reports and cleans-up obsolete installed kernels.

OPTIONS:
   -h      Show this message
   -a	   Show active kernel
   -i      Show installed kernels
   -o	   Show obsolete kernels
   -u	   Upgrade to the latest kernel
   -r      Remove obsolete kernels
EOF
}

while getopts "haiour" OPTION
do
	case $OPTION in
	 h)
	 	usage
	 	exit 1
	 	;;
	 a)
		echo "-----------------------------------------------------------"
		echo "Active kernel for `hostname`"
		echo "on `date`:";echo;
		echo "------>   `uname -srmo`   <------"
		exit
		;;
	 i)
	 	echo "-----------------------------------------------------------"
		echo "Kernels installed:";echo;
		dpkg -l | grep linux-image-;
		exit
	 	;;
	 o)
	 	echo "-----------------------------------------------------------"
		echo "Kernels to be removed:";echo;
		dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -3 
		exit
	 	;;
	 u)
	 	echo "Upgrading to `dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | tail -n 1`..."
	 	/usr/sbin/update-grub
		echo "Please consider rebooting..";echo;		
		exit	 	
		;;
	 r)
		echo "Removing kernels..."
		apt-get purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -3) --assume-yes
		echo "Updating GRUB.."
		/usr/sbin/update-grub
	 	;;
	 ?)
	 	usage
	 	exit
	 	;;
	 esac
done

if [ -z "$1" ]; then
usage
exit 1
fi