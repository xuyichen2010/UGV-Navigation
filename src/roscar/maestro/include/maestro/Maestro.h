#ifndef MAESTRO_H
#define MAESTRO_H

#include <stdint.h>
#include <string>

class Maestro {

public:
    Maestro(std::string, uint8_t, uint8_t);
    ~Maestro();
    int getError();
    int getDrivePosition();
    int getSteeringPosition();
    bool setDrivePosition(uint16_t);
    bool setSteeringPosition(uint16_t);
    bool setSteerChangeRate(uint16_t);
    bool setDriveChangeRate(uint16_t);
    bool goHome();

private:
    int fd_;
    uint8_t drive_channel_;
    uint8_t steering_channel_;

    // disable assignment and copy constructor
    Maestro& operator=(const Maestro&);
    Maestro(const Maestro&);
};

#endif // MAESTRO_H
