#ifndef CONVERTER_H
#define CONVERTER_H

#include <stdint.h>
#include <string>
#include <fstream>
#include <vector>
#include <iostream>
#include <string.h>
#include <iterator>
#include <sstream>
#include <stdlib.h>

using namespace std;

class Converter{

public:
    Converter(string motorFileName, string servoFileName);
    ~Converter();
    void convertToPulsewidth(double vel, double ang, double& convertedVel, double& convertedAngle);
    void convertFromPulsewidth(double vel, double ang, double& convertedVel, double& convertedAngle);
    double lerp(double start1, double end1, double x, double start2, double end2);

private:
    vector<double> motorPulsewidths;
    vector<double> motorVelocities;
    vector<double> servoPulsewidths;
    vector<double> servoAngles;

};

#endif // CONVERTER_H
