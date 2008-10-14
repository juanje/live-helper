#!/bin/sh

# exit.sh - cleanup
# Copyright (C) 2006-2008 Daniel Baumann <daniel@debian.org>
#
# live-helper comes with ABSOLUTELY NO WARRANTY; for details see COPYING.
# This is free software, and you are welcome to redistribute it
# under certain conditions; see COPYING for details.

set -e

Exit ()
{
	if [ "${LH_DEBUG}" = "enabled" ]
	then
		# Dump variables
		set | grep -e ^LH
	fi

	# Always exit true in case we are not able to unmount
	# (e.g. due to running processes in chroot from user customizations)
	umount chroot/dev/pts > /dev/null 2>&1 || true
	umount chroot/proc > /dev/null 2>&1 || true
	umount chroot/selinux > /dev/null 2>&1 || true
	umount chroot/sys > /dev/null 2>&1 || true
}
