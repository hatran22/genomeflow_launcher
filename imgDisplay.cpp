#include <opencv/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char** argv)
{
    // Read the image file using the 
    Mat image = imread(argv[1]);

    // Check for failure
    if (image.empty()) 
    {
    cout << "Image does not exist" << endl;
    cin.get(); //wait for any key press
    return -1;
    }

    String window = "window"; //Name of the window

    namedWindow(window); // Create a window

    imshow(window, image); // Show our image inside the created window.
    // exit upon keypress
  // see if there is a waiting keystroke
    char key = cv::waitKey(10);
    if( key == 'q') {
        break;
    }

    return 0;
}