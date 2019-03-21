#include "maestro/Converter.h"

#include <iostream>

using namespace std;

int main(){

    string motor = "/home/nuccar/roscar_ws/src/roscar/maestro/src/motorConfig.txt";
    string servo = "/home/nuccar/roscar_ws/src/roscar/maestro/src/servoConfig.txt";
    
    cout << motor << endl;
    cout << servo << endl;

    Converter conv(motor, servo);

    double convertedVel = 0;
    double convertedAngle = 0;
    /*
    conv.convertToPulsewidth(1.0, 2.2, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    conv.convertToPulsewidth(5.2, 5.2, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    conv.convertToPulsewidth(5.5, 5.5, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    conv.convertToPulsewidth(10, 10, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    conv.convertFromPulsewidth(3000, 3000, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    conv.convertFromPulsewidth(4000, 4000, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    conv.convertFromPulsewidth(4500, 4500, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    conv.convertFromPulsewidth(9000, 9000, convertedVel, convertedAngle);
    cout << "converted vel: " << convertedVel << endl;
    cout << "converted ang: " << convertedAngle << endl;
    cout << endl;

    double val;
    val = conv.lerp(0.0,10.0,2.0,5.0,6.0);
    cout << "Lerp: " << val << endl;
    */

    double vel = -1.0;
    double ang = -2.5;
    double vel2 = 0;
    double ang2 = 0;

    while(vel < 9.0 && ang < 2.5){
        cout << "Vel Before: " << vel << endl;
        cout << "Angle Befoe: " << ang << endl;
        conv.convertToPulsewidth(vel,ang,vel2,ang2);
        cout << "Vel Intermediate PW: " << vel2 << endl;
        cout << "Ang Intermediate PW: " << ang2 << endl;
        conv.convertFromPulsewidth(vel2,ang2,vel,ang);
        cout << "Vel After: " << vel << endl;
        cout << "Angle After: " << ang << endl;
        
        vel += 0.1;
        ang += 0.3;

        cout << endl;

    }
    

    return 0;
}
