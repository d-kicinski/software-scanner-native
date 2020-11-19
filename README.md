# software-scanner-native
[![](https://jitpack.io/v/d-kicinski/software-scanner-native.svg)](https://jitpack.io/#d-kicinski/software-scanner-native)

Repository contains simple c++ library that enables user to detect and extract kind-of-rectangular white shapes from images.
Native code is packaged into android library. For example usage visit https://github.com/dawidkski/software-scanner. :^)

Project uses git-lfs so you'll need to install it in order to use bundled `.so`.

### Running tests
To sanity-check if bundled .so would work on your device run `connectedAndroidTest` with
```bash
./gradlew build cAT
```

### Compiling native code
1. Make sure you have both Android SDK and NDK installed. It is assumed that these could be find in default path suggested by Android Studio.
Which is `$HOME/Android/Sdk`. Setup `local.properties` file. If you're using Android Studio it will be taken care of.

2. Install SWIG.
```bash
# ubuntu based distro
sudo apt install swig

# arch based distro
sudo pacman -Syu swig
```

3. Download OpenCV for Android, unpack it and place its content in `deps/opencv` directory
```bash
./scripts/build-opencv-android.sh
```

4. Compile using this convenience script
```bash
./scripts/build-scanner-android.sh
```
Then again run simple test to validate compiled libs with `./gradlew build cAT`
