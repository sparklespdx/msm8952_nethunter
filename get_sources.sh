#!/bin/bash

# -- Kali Nethunter Build Environment --
#         Get Android Sources
#
#
# NOTE: This needs to be updated with each device.
# Device: Motorola msm8952
#

cd /vagrant

# Kernel
git clone https://github.com/LineageOS/android_kernel_motorola_msm8952.git && cd android_kernel_motorola_msm8952
git checkout -b cm-14.1 origin/cm-14.1
cd ..

# Kali Nethunter
git clone https://github.com/offensive-security/kali-nethunter.git
