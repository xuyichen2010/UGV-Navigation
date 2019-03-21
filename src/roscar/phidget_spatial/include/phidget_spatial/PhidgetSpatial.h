#ifndef PHIDGETS_SPATIAL_H
#define PHIDGETS_SPATIAL_H

#include <phidget21.h>
#include "phidget_spatial/Inertia.h"
#include <boost/thread/mutex.hpp>

static double time_secs_;
static double time_micro_secs_;
static double x_accel_;
static double y_accel_;
static double z_accel_;
static double x_angular_;
static double y_angular_;
static double z_angular_;
static double x_mag_field_;
static double y_mag_field_;
static double z_mag_field_;
static int sample_count_ = 0;  //number of samples until getInertia() is called

class PhidgetSpatial {

public:
    PhidgetSpatial();
    ~PhidgetSpatial ();
    phidget_spatial::Inertia getInertia();
private:
    CPhidgetSpatialHandle handle_;
    boost::mutex lock_;

    // disable assigment and copy copy constructor
    PhidgetSpatial& operator=(const PhidgetSpatial&);
    PhidgetSpatial(const PhidgetSpatial&);

    static int AttachHandler(CPhidgetHandle, void*);
    static int DetachHandler(CPhidgetHandle, void*);
    static int ErrorHandler(CPhidgetHandle, void*, int, const char*);
    static int SpatialDataHandler(CPhidgetSpatialHandle phid, void *userptr, CPhidgetSpatial_SpatialEventDataHandle *data, int count);

};

#endif // PHIDGETS_SPATIAL_H

