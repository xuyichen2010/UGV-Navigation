#ifndef PHIDGETS_ENCODER_H
#define PHIDGETS_ENCODER_H

#include <phidget21.h>
#include "phidget_encoder/Ticks.h"
#include <boost/thread/mutex.hpp>

static int position_;
static int relative_change_;
static int elapsed_time_;

class PhidgetEncoder {

public:
    PhidgetEncoder();
    ~PhidgetEncoder();
    phidget_encoder::Ticks getTicks();
private:
    CPhidgetEncoderHandle handle_;
    boost::mutex lock_;

    // disable assigment and copy copy constructor
    PhidgetEncoder& operator=(const PhidgetEncoder&);
    PhidgetEncoder(const PhidgetEncoder&);

    static int AttachHandler(CPhidgetHandle, void*);
    static int DetachHandler(CPhidgetHandle, void*);
    static int ErrorHandler(CPhidgetHandle, void*, int, const char*);
    static int InputChangeHandler(CPhidgetEncoderHandle, void*, int, int);
    static int PositionChangeHandler(CPhidgetEncoderHandle, void*, int, int, int);
};

#endif // PHIDGETS_ENCODER_H
