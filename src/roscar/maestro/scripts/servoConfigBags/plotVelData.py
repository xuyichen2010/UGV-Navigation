#!/usr/bin/env python

import rospy
import rosbag
import sys
import math

import phidget_encoder

import numpy as np
import matplotlib.pyplot as plt

if __name__ == '__main__':

    if len(sys.argv) != 2:
        print 'Usage: python plotVelData.py <bagfile>'
        exit()

    bag = rosbag.Bag(sys.argv[1], 'r')
    topics = ['/ticks', '/maestro_out']
    data = []
    data2 = []
    size = 100
    kernel = np.ones(size)/size;

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
    
    count = 0

    for topic, msg, t, in bag.read_messages(topics=topics):
        if topic == "/ticks":

            dx = msg.relative_change
            dt = msg.elapsed_time
            #if we have dt = 0 skip this data point
            if dt == 0:
                continue
            count += 1
            ticksPerMillisecond = dx / dt
            ourConv = ticksPerMillisecond * ticksToMph
            theirConv = ticksPerMillisecond * matlabConv
            time = t.secs

            data.append([count, ourConv])

        if topic == "/maestro_out":
            
            data2.append([msg.drive_position, msg.steering_position])

    data = np.array(data)
    data2 = np.array(data2)

    mean = np.mean(data[86:145,1]) 
    meanArray = np.array([mean,mean])
    meanTime = np.array([1,count])

    mean2 = np.mean(data2[300:310,0])

    

    
    
    """
    xOutput = np.convolve(data[:,1],kernel,'same')
       
    xStd = np.std(data[15000:,1])
    yMean = np.mean(data[15000:,2])
    yStd = np.std(data[15000:,2])    
    zMean = np.mean(data[15000:,3])
    zStd = np.std(data[15000:,3])
    print "X Angular Mean",xMean,'\n'
    print "X Angular StdDev",xStd,'\n'
    print "Y Angular Mean",yMean,'\n'
    print "Y Angular StdDev",yStd,'\n'
    print "Z Angular Mean",zMean,'\n'
    print "Z Angular StdDev",zStd,'\n'
    """

    t = data[:,0]
    y1 = data[:,1]
    #y2 = data[:,2]

    maestroOutVel = data2[:,0]
    maestroOutAng = data2[:,1]

    fig, ax = plt.subplots()
    ax.plot(t,y1,'b', meanTime, meanArray, 'g')

    #fig, bx = plt.subplots()
    #bx.plot(maestroOutVel, 'bo')
    
    fig,cx = plt.subplots()
    cx.plot(maestroOutAng, 'ro')

    #bx.set_title('maestro out vel')
    cx.set_title('maestro out ang')

    """
    plt.xlabel('Count')
    plt.ylabel('Velocity (m/s)')
    plt.title('Velocity vs. Count for Pulsewidth 7200')
    """

    print "Mean1: " + str(mean) + "\n"
    print "Mean2: " + str(mean2)

    #ax.axis('equal')
    plt.show()
