# Will need swig
set(CMAKE_SWIG_FLAGS)
find_package(SWIG REQUIRED)
include(UseSWIG)

if (${SWIG_VERSION} VERSION_GREATER_EQUAL 4)
    list(APPEND CMAKE_SWIG_FLAGS "-doxygen")
endif ()

list(APPEND CMAKE_SWIG_FLAGS "-DSWIGWORDSIZE64")

# Find Java
find_package(Java 1.8 COMPONENTS Development REQUIRED)
find_package(JNI REQUIRED)

# Create the native library
add_library(jniscanner "")
set_target_properties(jniscanner PROPERTIES
        POSITION_INDEPENDENT_CODE ON)
set_target_properties(jniscanner PROPERTIES INSTALL_RPATH "$ORIGIN")


# Needed by java/CMakeLists.txt
set(JAVA_PACKAGE com.github.dawidkski.scanner)
set(JAVA_PACKAGE_PATH src/main/java/com/github/dawidkski/scanner)
set(JAVA_RESOURCES_PATH src/main/resources)
set(NATIVE_IDENTIFIER arm64-v8a)
set(JAVA_NATIVE_PROJECT scanner-jni-${NATIVE_IDENTIFIER})
set(JAVA_PROJECT scanner-jni)

# Swig wrap all libraries
add_subdirectory(scanner/java)
target_link_libraries(jniscanner PRIVATE jniScanner)
