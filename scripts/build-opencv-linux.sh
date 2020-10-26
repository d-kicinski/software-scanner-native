# Download and unpack sources
mkdir -p deps && cd deps
wget https://github.com/opencv/opencv/archive/master.zip
unzip master.zip
rm master.zip
mv opencv-master opencv
cd ..

# Install dependencies (OPTIONAL)
#sudo apt -y install build-essential checkinstall cmake pkg-config yasm
#sudo apt -y install git gfortran
#sudo apt -y install libjpeg8-dev libpng-dev
#sudo apt -y install software-properties-common
#sudo apt -y install libjasper1
#sudo apt -y install libtiff-dev
#sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
#sudo apt -y install libxine2-dev libv4l-dev
#sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
#sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
#sudo apt -y install libatlas-base-dev
#sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
#sudo apt -y install libvorbis-dev libxvidcore-dev
#sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
#sudo apt -y install libavresample-dev
#sudo apt -y install x264 v4l-utils

rm -r deps/opencv-linux-build
cmake -Bdeps/opencv-linux-build \
      -DBUILD_LIST=core,imgproc,imgcodecs,highgui \
      -DWITH_EIGEN=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      deps/opencv

cd deps/opencv-linux-build && make -j 12
