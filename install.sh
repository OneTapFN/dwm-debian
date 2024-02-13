#!/usr/bin/sh

sudo apt install xorg dunst fonts-jetbrains-mono desktop-base xserver-xorg-video-intel stterm suckless-tools build-essential libx11-dev libxinerama-dev libxft-dev git vim libwebkit2gtk-4.0-dev neovim fonts-font-awesome nitrogen wget feh htop rofi pluma firefox-esr pavucontrol -y

sudo mkdir /etc/X11/xorg.conf.d/
sudo touch /etc/X11/xorg.conf.d/20-intel.conf
sudo echo 'Section "Device"' >> /etc/X11/xorg.conf.d/20-intel.conf
sudo echo '  Identifier "Intel Graphics"' >> /etc/X11/xorg.conf.d/20-intel.conf
sudo echo '  Driver "intel"' >> /etc/X11/xorg.conf.d/20-intel.conf
sudo echo '  Option "TearFree" "true"' >> /etc/X11/xorg.conf.d/20-intel.conf
sudo echo '  Option "TripleBuffer" "On"' >> /etc/X11/xorg.conf.d/20-intel.conf
sudo echo 'EndSection' >> /etc/X11/xorg.conf.d/20-intel.conf

mkdir /onetap/.config
cp -r ./config/* /onetap/.config

cd ./dwm-config/
tar -xf ./dwm-config.tar.gz
rm ./dwm-config.tar.gz
cd ..

cd ./themes/
tar -xf ./Nordic-darker.tar.xz
sudo cp -r ./Nordic-darker/ /usr/share/themes/
rm ./Nordic-darker.tar.xz
tar -xf ./Nordzy-dark.tar.gz
sudo cp -r ./Nordzy-dark/ /usr/share/icons/
cp ..

cd ./st-0.9
tar -xf ./st-0.9.tar.gz
rm ./st-0.9.tar.gz
cd ..

cd ./config
tar -xf ./config.tar.gz
rm ./config.tar.gz
cd ..

cd ./dwm-config/
sudo make clean install
cd ..

cd ./st-0.9/
sudo make clean install

cp ./xinitrc /onetap/.xinitrc
chmod +x /onetap/.xinitrc

sudo touch /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo 'Section "InputClass"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo '        Identifier "touchpad"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo '        MatchIsTouchpad "on"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo '        Driver "libinput"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo '        Option "Tapping" "on"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo '        Option "TappingButtonMap" "lrm"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo '        Option "ScrollMethod" "twofinger"' >> /etc/X11/xorg.conf.d/90-touchpad.conf
sudo echo 'EndSection' >> /etc/X11/xorg.conf.d/90-touchpad.conf

mkdir /onetap/.git
cp -r ./dwm-config /onetap/.git
cp -r ./st-0.9 /onetap/.git
chmod +x /onetap/.git/dwm-config/bar.sh
