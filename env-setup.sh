# env-setup runs install commands to set most common used software up. 
#
# Copyright (C) 2015 Julien BREHIN, aka. Aand
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

#!/bin/bash

if [ "$(id -u)" != "0"]; then
	echo "Sorry, you need root level of privileges to run this.\n"
	exit 1
fi
#if [[ $1 != "" ]]

echo "Upgrading current software..."
dnf upgrade -y
echo "Done upgrading.\n"
echo "Installing commmonly used packages from Fedora repo..."
dnf install -y texlive-collection-genericextra texlive-documentation texlive-collection-fontsextra texlive-collection-latexextra texlive-collection-langfrench texlive-collection-langenglish texlive-collection-langeuropean texlive-collection-bibtexextra redshift gnome-tweak-tool thunderbird conky unzip gimp inkscape weechat valgrind gdb dnf-plugins-core
echo "Done installing Fedora packages.\n"
echo "Installing Sublime Text 3..."
curl -L git.io/sublimetext | sh
echo "Done installing ST3.\n"
echo "Installing RPMFusion repo (free + non-free) and related packages..."
rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
rpm -ivh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
dnf install -y vlc
echo "Done installing RPMFusion.\n"
echo "Installing copr software..."
dnf copr enable spot/chromium
dnf copr enable hadrons123/thermald
dnf install chromium thermal-daemon
systemctl enable tehrmald.service
systemctl start thermald.service
echo "Done installing copr software.\n"
