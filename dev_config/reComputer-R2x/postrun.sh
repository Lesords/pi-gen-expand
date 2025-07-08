#!/bin/bash -e
set -x

# install examples
echo ${FIRST_USER_NAME}

cd /home/${FIRST_USER_NAME}
pwd
uname -a
git clone https://github.com/hailo-ai/hailo-rpi5-examples.git --depth 1
cd hailo-rpi5-examples
sed -i 's/device_arch=.*$/device_arch=HAILO8/g' setup_env.sh
./install.sh || true

cd /home/${FIRST_USER_NAME}
git clone https://github.com/Lesords/dotfiles.git --depth 1
cd dotfiles
./dot install

cd /home/${FIRST_USER_NAME}
git clone https://github.com/Lesords/vim-config.git .vim --depth 1 --recurse-submodules --shallow-submodules

mkdir -p .local/bin
git clone https://github.com/Lesords/My-Linux-Tool.git --depth 1
cd My-Linux-Tool
./generate --arm
./install
free -h
swapon --show
df -h
rm -rf ./bin
rm -rf ./lib

free -h
swapon --show
df -h
