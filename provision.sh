#!/bin/bash

# -- Kali Nethunter Build Environment --
#         Provisioning Script
#
# This provisions an Android kernel / Kali Nethunter 
# build environment for Ubuntu 14.04.5 LTS.
#
# Run this as part of a Vagrant provisioning run.
#


cd /vagrant


# Download and install openJDK 8
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jre-headless_8u45-b14-1_amd64.deb 2>/dev/null
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jre_8u45-b14-1_amd64.deb 2>/dev/null
wget http://archive.ubuntu.com/ubuntu/pool/universe/o/openjdk-8/openjdk-8-jdk_8u45-b14-1_amd64.deb 2>/dev/null

apt-get update

for i in $(ls . | grep \.deb); do
  dpkg -i $i && rm $i
done

apt-get -f install -y


# Android Kernel build dependencies
apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python-networkx
