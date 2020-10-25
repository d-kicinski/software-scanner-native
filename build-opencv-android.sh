mkdir -p deps && cd deps
wget https://github.com/opencv/opencv/releases/download/4.4.0/opencv-4.4.0-android-sdk.zip
unzip opencv-4.4.0-android-sdk.zip
rm opencv-4.4.0-android-sdk.zip
mv OpenCV-android-sdk opencv-android-prebuild
cd ..
