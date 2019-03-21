#!/usr/bin/env python

import rospy
import rosbag
import sys
import math

import nav_msgs

import tf

import numpy as np
import matplotlib.pyplot as plt

import utm

if __name__ == '__main__':

    tolerance = 0.2

    point1 = ( 0.9, 0 )
    point2 = (1.8, -0.9)
    point3 = (3.15, -1.8)

    easting = [ point1[0], point2[0], point3[0] ]
    northing= [ point1[1], point2[1], point3[1] ]

    tuplePointList = [point1, point2, point3]
   

    np.set_printoptions(threshold=np.nan)

    if len(sys.argv) != 2:
        print 'Usage: python plotOpenLoop.py <bagfile>'
        exit()

    #variables for our conversion
    signConversion = -1
    meters = 3.66 #distance taped out and measured
    ticks = 126176 #empirically measured ten times and averaged
    secToMs = 1000
    mpsToMph = 2.23694
    ticksToMph = (signConversion * meters / ticks) * secToMs #* mpsToMph 

    #other conversion variables
    circ = 0.05 * 2 * math.pi
    ratio = -11.0/29 * 3.36 #encoder to wheel
    matlabConv = (circ * ratio / 4096) * secToMs #* mpsToMph

    bag = rosbag.Bag(sys.argv[1], 'r')
    topics = ['/open_loop_odometry', '/converter_out', '/maestro_out', '/maestro_in', '/joy', '/converter_in', '/ticks', '/inertia', '/kalman_odometry', '/gps_data']
    data = []
    data2 = []
    data3 = []
    data4 = []
    data5 = []
    data6 = []
    data7 = []
    data8 = []
    data9 = []
    data10 = []
        
    count = 1

    currentIn = 6000
    currentInAng = 6000
    currentConvOutVel = 0
    currentConvOutAng = 0

    for topic, msg, t, in bag.read_messages(topics=topics):
        if topic == "/open_loop_odometry":

            x = msg.pose.pose.position.x
            y = msg.pose.pose.position.y
            
            data.append([x, y])

        if topic == "/converter_out":
            vel = msg.velocity
            ang = msg.angle

            currentConvOutVel = vel
            currentConvOutAng = ang

            count += 1

            data2.append([vel,ang,count])

        if topic == "/maestro_out":
            data4.append([currentIn, currentInAng])
            data3.append([msg.drive_position, msg.steering_position])

        if topic == "/maestro_in":
            currentIn = msg.drive_position
            currentInAng = msg.steering_position
            #data4.append([msg.drive_position, msg.steering_position])

        if topic == "/joy":
            data5.append([msg.axes[5],msg.axes[0]])
            

        if topic == "/converter_in":
            data6.append([msg.velocity, msg.angle])

        if topic == "/ticks":

            dx = msg.relative_change
            dt = msg.elapsed_time
            #if we have dt = 0 skip this data point
            if dt == 0:
                continue
            ticksPerMillisecond = dx / dt
            ourConv = ticksPerMillisecond * ticksToMph
            theirConv = ticksPerMillisecond * matlabConv
            time = t.secs

            data7.append([ourConv, theirConv, currentConvOutVel])

        if topic == "/inertia":
            radAng = (msg.zAngular * math.pi) / 180.0
            data8.append([radAng, currentConvOutAng])

        if topic == "/kalman_odometry":

            x = msg.pose.pose.position.x
            y = msg.pose.pose.position.y

            #type(pose) = geometry_msgs.msg.Pose
            quaternion = (msg.pose.pose.orientation.x, msg.pose.pose.orientation.y, msg.pose.pose.orientation.z, msg.pose.pose.orientation.w)
            euler = tf.transformations.euler_from_quaternion(quaternion)
            roll = euler[0]
            pitch = euler[1]
            yaw = euler[2]
            
            data9.append([x, y, yaw])
    
        if topic == "/gps_data":

            ang = (-1 * (msg.heading - 90) ) * (np.pi / 180)
            while(ang <= -np.pi):
                ang += 2*np.pi
            while(ang > np.pi):
                ang -= 2*np.pi

            data10.append([ang, msg.heading])

    data9 = np.array(data9)
    data6 = np.array(data6)
 
    kfX = data9[:,0]
    kfY = data9[:,1]

    yawArr = data9[:,2]

    angleCommands = data6[:,1]

    fig, ax = plt.subplots()
    ax.plot(kfX,kfY,'bo', easting, northing, 'ro')
    #ax.plot(easting, northing, 'ro')
    for point in tuplePointList:
        ax.add_patch(plt.Circle(point, tolerance, color='g', fill=False))
    
    fig, bx = plt.subplots()
    bx.plot(yawArr, 'go')
    bx.set_title('Yaw Values')

    fig, cx = plt.subplots()
    cx.plot(angleCommands, 'ro')
    cx.set_title('Commanded Angular Velocities')

    ax.set_title('XY Position')
    
    ax.axis('equal')
    plt.show()

