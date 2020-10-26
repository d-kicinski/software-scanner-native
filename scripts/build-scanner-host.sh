
BUILD_DIR=build-cmake/host

rm -r ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
cmake -B ${BUILD_DIR} -S . \
 -DANDROID=OFF \
 -DSWIG=OFF \
 -DHOST=ON \
 -Wno-dev
cd ${BUILD_DIR} && make -j 10
cd bin && ./tests
cd ../..
