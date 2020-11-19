cmake_minimum_required(VERSION 3.10)
project(libscanner VERSION 0.2.1 LANGUAGES CXX)

# Import external targets
find_package(OpenCV)

# Create target and set properties
add_library(scanner SHARED src/scanner)

# Add an alias so that library can be used inside the build tree, e.g. when testing
add_library(Scanner::scanner ALIAS scanner)

# Set target properties
target_include_directories(scanner
        PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        )

target_compile_features(scanner PRIVATE cxx_auto_type)
target_compile_options(scanner PRIVATE -Werror)

if(ANDROID)
    target_link_libraries(scanner
            PUBLIC
            opencv_java)
else()
    target_link_libraries(scanner
            PUBLIC
            opencv_core
            opencv_imgproc)
endif()

if (HOST)
    add_subdirectory(libs/Catch2)
    add_executable(tests
            tests/test_scanner.cpp)
    target_link_libraries(tests
            scanner
            opencv_imgcodecs
            opencv_highgui
            Catch2::Catch2WithMain)
    include(libs/Catch2/extras/Catch.cmake)
    enable_testing()
    catch_discover_tests(tests)

    file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/tests/resources DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
endif ()
