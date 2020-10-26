#include <catch2/catch_test_macros.hpp>

#include <scanner/scanner.hpp>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

constexpr static  bool DISPLAY = false;

auto maybe_display(cv::Mat const &img) -> void
{
    if (DISPLAY) {
        cv::imshow("Display window", img);
        cv::waitKey(0); // Wait for a keystroke in the window
    }
}

TEST_CASE("get hello message") { REQUIRE("Hello from scanner library!" == scanner::hello()); }

TEST_CASE("draw contour")
{
    cv::Mat img = cv::imread("resources/test_image.jpg", cv::IMREAD_COLOR);
    scanner::draw_contour((unsigned long int)&img);
    maybe_display(img);
}

TEST_CASE("software scanner")
{
    cv::Mat img = cv::imread("resources/test_image.jpg", cv::IMREAD_COLOR);
    cv::Mat scan;
    scanner::software_scanner((unsigned long int)&img, (unsigned long int)&scan);
    maybe_display(scan);
}
