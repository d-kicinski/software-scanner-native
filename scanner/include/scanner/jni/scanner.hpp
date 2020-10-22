#pragma once

#include <string>

#include <scanner/scanner.hpp>


void drawContour(unsigned long int inputPtr) {
    scanner::draw_contour(inputPtr);
}

void softwareScanner(unsigned long int inputPtr, unsigned long int outputPtr) {
    scanner::software_scanner(inputPtr, outputPtr);
}

auto hello() -> std::string {
    return scanner::hello();
}
