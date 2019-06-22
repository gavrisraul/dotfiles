#!/bin/bash
sudo apt install feh bc scrot brightnessctl exuberant-ctags build-essential \
cmake python3-dev python3-pip python-pip ack tmux curl zsh git rofi libxcb1-dev \
libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev \
libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev \
libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev \
libxkbcommon-x11-dev autoconf xutils-dev libtool automake libxcb-xrm-dev i3 \
i3blocks libev-dev libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0 \
libxcb-randr0 libxcb-xinerama0-dev libxcb-xkb-dev libxcb-image0-dev \
libxcb-util-dev libxkbcommon-x11-dev libjpeg-turbo8-dev libpam0g-dev \
fonts-font-awesome fonts-firacode arandr libxcb-composite0-dev libjpeg-dev \
x11-xserver-utils libpython3.6 numix-icon-theme-circle numix-gtk-theme \
imagemagick libappindicator1 libindicator7 libgconf2-4 konsole compton


sudo chmod u+s /usr/bin/brightnessctl


chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install


cd /tmp
git clone https://github.com/Airblader/i3blocks-gaps i3blocks
cd i3blocks
make clean debug # or make clean all
make install
sudo make install


cd /tmp
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts


cd
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


git clone https://github.com/PandorasFox/i3lock-color.git
cd i3lock-color
autoreconf --force --install

rm -rf build/
mkdir -p build && cd build/

../configure \
  --prefix=/usr \
  --sysconfdir=/etc \
  --disable-sanitizers

make
sudo make install
# don't forget to build i3lock to latest version


cd
git clone https://github.com/pavanjadhaw/betterlockscreen
cd betterlockscreen
cp betterlockscreen /usr/bin/


cd
# rofi-theme-selector
git clone https://github.com/davatorium/rofi-themes
cd rofi-themes
cd 'Official Themes'
sudo mv * /usr/share/rofi/themes
cd ..
cd 'User Themes'
sudo mv * /usr/share/rofi/themes
cd
rm -rf rofi-themes


cd
git clone https://github.com/gavrisraul/dotfiles
cd dotfiles
rm -rf .git README.md LICENSE
cp -ra . /home/rg/
cd
rm -rf dotfiles


# pip install pylint flake8 pylama
# pip3 install pynvim --upgrade
# sudo chown -R $(whoami) ~/.npm
