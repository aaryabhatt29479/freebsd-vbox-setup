#!/bin/sh

# Exit on error
set -e

echo "Updating pkg..."
pkg update && pkg upgrade -y

echo "Installing VirtualBox Guest Additions..."
pkg install -y virtualbox-ose-additions

echo "Enabling VirtualBox Guest Additions services..."
sysrc vboxguest_enable=YES
sysrc vboxservice_enable=YES

echo "Installing X11 and KDE Plasma..."
pkg install -y xorg kde5 sddm

echo "Enabling necessary services..."
sysrc dbus_enable=YES
sysrc hald_enable=YES
sysrc sddm_enable=YES

echo "Adding user to wheel and video groups..."
pw groupmod wheel -m mj29479
pw groupmod video -m mj29479

echo "Setup Complete. Please reboot now."
