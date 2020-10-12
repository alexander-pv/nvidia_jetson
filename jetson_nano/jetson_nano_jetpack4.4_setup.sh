#!/bin/bash

# Define useful constants and functions

# A timestamp function
get_timestamp() {
  local time_var=$(date +"%d-%m-%Y %H:%M:%S") # current timestamp
  echo "$time_var"
}
# Init time
INIT_TIME=$(get_timestamp)

# Jetson Nano Jetpack 4.4, OpenCV&CUDA, DeepStream 5.0 setup
echo "Updating existing packages..."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install nano, gedit
sudo apt-get -y install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran

echo "Installing python3 and necessary packages..."
sudo apt-get install python3-dev
sudo apt-get install python3-pip
sudo python3 -m pip install -U pip
sudo python3 -m pip install testresources setuptools cython jetson-stats
sudo python3 -m pip install -U numpy==1.16.1 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11

echo -e "\n\nInfo about jetson-stats jtop command for a device control: https://github.com/rbonghi/jetson_stats\n\n"
echo "Installing tensorflow 2.2. It may take some time to build all the needed packages..."
echo -e "\n\nImportant. import cv2 must be before tensorflow import, else 'raise cannot allocate memory in static TLS block'.\n\n"
sudo -H python3 -m pip install --no-cache-dir --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow

echo -e "Building OpenCV&CUDA. This will take about 6 hours to compile...\n\n"

opencv_t0=$(get_timestamp)
wget https://github.com/mdegans/nano_build_opencv/archive/master.zip
unzip -p master.zip nano_build_opencv-master/build_opencv.sh > ./build_opencv.sh
rm master.zip
sudo chmod 777 build_opencv.sh
sudo ./build_opencv.sh 4.1.1
opencv_t1=$(get_timestamp)

echo "OpenCV$CUDA was built. Start time: $opencv_t0. End time: $opencv_t1"
echo "To check whether installation is successfull, reboot the system and use 'jetson_release -v' in a terminal or use 'jtop' command."

echo -e "\n\nInstalling DeepStream...\n\n"
# About DeepStream
# https://docs.nvidia.com/metropolis/deepstream/dev-guide/index.html#page/DeepStream_Development_Guide/deepstream_quick_start.html#wwpID0E0GI0HA

sudo apt install \
    libssl1.0.0 \
    libgstreamer1.0-0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgstrtspserver-1.0-0 \
    libjansson4=2.11-1

sudo apt-get install ./deepstream_arm64.deb

echo -e "\n\nDeepStream installation is complete. To check the app, reboot the system and use samples in '/opt/nvidia/deepstream/deepstream-5.0/samples'\n\n"
echo -e "Sample example:\n'$ cd /opt/nvidia/deepstream/deepstream-5.0/samples/configs/deepatream-app'\n'$ depstream-app -c ./source8_1080p_dec_infer-resnet_tracker_tiled_display_fp16_nano.txt'"

END_TIME=$(get_timestamp)

echo -e "Installation time: start: $INIT_TIME, end: $END_TIME"



