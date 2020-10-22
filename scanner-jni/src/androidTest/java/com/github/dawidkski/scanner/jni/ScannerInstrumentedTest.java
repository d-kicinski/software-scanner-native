package com.github.dawidkski.scanner.jni;

import android.support.test.runner.AndroidJUnit4;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.opencv.core.CvType;
import org.opencv.core.Mat;

import static org.junit.Assert.*;


@RunWith(AndroidJUnit4.class)
public class ScannerInstrumentedTest {

    @BeforeClass
    public static void loadNativeLibraries() {
        System.loadLibrary("jniscanner");
    }

    @Test
    public void helloTest() {
        assertEquals("Hello from scanner library!", Scanner.hello());
    }

    public void softwareScannerTest() {
        Mat inputMat = new Mat(720, 1024, CvType.CV_8UC4);
        Mat outputMat = new Mat();
        Scanner.softwareScanner(inputMat.getNativeObjAddr(), outputMat.getNativeObjAddr());

        assertFalse(outputMat.empty());

        inputMat.release();
        outputMat.release();
    }

    public void drawContourTest() {
        Mat inputMat = new Mat(720, 1024, CvType.CV_8UC4);
        Scanner.drawContour(inputMat.getNativeObjAddr());

        assertFalse(inputMat.empty());

        inputMat.release();
    }

}