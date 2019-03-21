# README #
Phidget_encoder_node:
1.	Subscribe: none
2.	Publish:  /ticks
3.	Publish information: position, relative_change, elaspsed_time from getTicks() method

Phidget_spatial_node:
1.	Subscribe: none
2.	Publish: /inertia
3.	Publish information: timeSecs, timeMicroSecs, sAccel, yAccel, zAccel, xAngular, yAngular, zAngular, xMagField, yMagField, zMagField from getInertia() method

Phidget_gps_node:
1.	Subscribe: none
2.	Publish: /gps_data
3.	Publish information: fix_status, latitude, longitude, altitude, is_velocity_valid, velocity, is heading_valid, heading

Odemetry_node:
1.	Subscribe: 
a.	/ticks            spatialCallback(): update the angularVelocity from zAngular
b.	/gps_data    gpsCallback():  setup latitude, longitude, altitude, heading, and update position(0), position(1), position(2) respect to easting, northing, and heading, update the position using Kalman Filter by calling measurementUpdatePhase()
c.	/inertia         encoderCallback(): calculate the velocity in m/s by relative_change/elaspsed_time
2.	Publish: 
a.	/odom          position.x(xPrime), position.y(yPrime), position.z(0.0), linear.x(velocity), angular.z(angularVelocity), orientation(calculated from thetaPrime)
3.	Information handling: 
a.	timeUpdatePhase(): update current position
i.	setup variables, xCurr = position(0), yCurr = position(1), theta = positon(2)
ii.	calculate xPrime, yPrime, and thetaPrime:
1.	xPrime = xCurr + (velocity * dt * (cos(theta))
2.	yPrime = yCurr + (velocity * dt * (sin(theta))
3.	thetaPrime  = theta + angularVelocity * dt;
iii.	update the current positon to xPrime, yPrime, thetaPrime
b.	measurementUpdatePhase(): computing Kalman Gain to update covariance and position(2)
c.	projectCovariance(): update covariance matrix prediction

Gps_waypoint_following_node:
1.	Subscribe:
a.	/odom                      odometryCallback(): get the xCurr(position.x) and yCurr(position.y), and calculate thetaCurr(this is same as theta in /odom)
b.	/start_command    startCallback: check if data is “start” to start the program
2.	Publish: /converter_in, /cmd_vel
a.	/converter_in          velocity(0.7), angle(angVel)
b.	/cmd_vel                  linear.x(velocity), angular.z(angVel)
3.	Information handling:
a.	sampleAndProjectControls(): try the best angVel with shortest distance to current point

Converter_node:
1.	Subscribe:
a.	/converter_in        targetsCallback(): get the vel(velocity) and ang(calculate from angle), then get drive_position and steering_position from convertToPulsewidth(), then publish them to /maestro_in
b.	/maestro_out        pulsewidthCallback(): get the vel(drive_position) and ang(steering_position), then get velocity, angle, and currTime from convertFromPulsewidth(), then publish them to /converter_out
c.	/inertia                    imuCallback(): get zAngular and convert it to radian as currentOmega to calculate ang 
2.	Publish: /maestro_in, /converter_out

Maestro_node:
1.	Subscribe: 
a.	/maestro_in      callback: set the drive_position and steering_position
2.	Publish: 
a.	/maestro_outPublish information: drive_position, steering_position, currTime

