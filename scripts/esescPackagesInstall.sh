#/bin/bash

# Ubuntu 12.04
sudo apt-get install -y build-essential
sudo apt-get install -y g++
sudo apt-get install -y cmake
sudo apt-get install -y libboost-dev
sudo apt-get install -y bison flex
sudo apt-get install -y python
sudo apt-get install -y libglib2.0
sudo apt-get install -y libpixman-1-dev
sudo apt-get install -y zlib1g-dev

# Ubuntu 16.04
sudo apt-get install -y qemu-kvm
sudo apt-get install -y libfdt-dev
sudo apt-get install -y libvirt-bin
sudo apt-get install -y ubuntu-vm-builder
sudo apt-get install -y bridge-utils
sudo apt-get install -y autoconf
sudo apt-get install -y libtool
sudo apt-get install -y libsdl-console
sudo apt-get install -y libsdl-console-dev
sudo apt-get install -y libglfw3-dev libgles2-mesa-dev
sudo apt-get install -y libepoxy-dev
sudo apt-get install -y uuid-dev
sudo apt-get install -y libssh2-1 libssh2-1-dev
sudo apt-get install -y libaio-dev
sudo apt-get install -y curl libcurl3 libcurl3-dev

sudo apt-get install -y libfreetype6-dev
sudo apt-get install -y libcairo2-dev
sudo apt-get install -y pango1.0
sudo apt-get install -y libgtk2.0-dev

sudo apt-get install -y git-email
sudo apt-get install -y libbluetooth-dev libbrlapi-dev libbz2-dev
sudo apt-get install -y libcap-dev libcap-ng-dev libcurl4-gnutls-dev libgtk-3-dev
sudo apt-get install -y libibverbs-dev libjpeg8-dev libncurses5-dev libnuma-dev
sudo apt-get install -y librbd-dev librdmacm-dev
sudo apt-get install -y libsasl2-dev libsdl1.2-dev libseccomp-dev libsnappy-dev
sudo apt-get install -y libvde-dev libvdeplug-dev libvte-2.90-dev libxen-dev liblzo2-dev
sudo apt-get install -y valgrind xfslibs-dev 
sudo apt-get install -y libnfs-dev libiscsi-dev


echo  "Done install -ying packages for ESESC"
exit 0
