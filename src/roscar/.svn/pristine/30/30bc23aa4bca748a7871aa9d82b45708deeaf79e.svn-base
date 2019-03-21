#ifndef PHIDGETS_GPS_H
#define PHIDGETS_GPS_H

#include <phidget21.h>
#include "phidget_gps/Data.h"
#include <boost/thread/mutex.hpp>

static bool fix_status_;
static double latitude_;
static double longitude_;
static double altitude_;
bool is_velocity_valid_;
static double velocity_;
bool is_heading_valid_;
static double heading_;

class PhidgetGPS {

public:
    PhidgetGPS();
    ~PhidgetGPS();
    phidget_gps::Data getData();
private:
    CPhidgetGPSHandle handle_;
    boost::mutex lock_;

    // disable assigment and copy copy constructor
    PhidgetGPS& operator=(const PhidgetGPS&);
    PhidgetGPS(const PhidgetGPS&);

    static int AttachHandler(CPhidgetHandle, void*);
    static int DetachHandler(CPhidgetHandle, void*);
    static int ErrorHandler(CPhidgetHandle, void*, int, const char*);
    static int PositionChangeHandler(CPhidgetGPSHandle, void*,
            double, double, double);
    static int FixChangeHandler(CPhidgetGPSHandle, void*, int);
};

#endif // PHIDGETS_GPS_H
