#!/usr/bin/env python

import rospy
import rosbag
import sys
import math

import phidget_spatial

import numpy as np
import matplotlib.pyplot as plt

if __name__ == '__main__':

    if len(sys.argv) != 2:
        print 'Usage: python plotVelData.py <bagfile>'
        exit()

    bag = rosbag.Bag(sys.argv[1], 'r')
    topics = ['/inertia']
    data = []
    size = 100
    kernel = np.ones(size)/size;

    count = 0

    for topic, msg, t, in bag.read_messages(topics=topics):
        if topic == "/inertia":

            zAng = msg.zAngular 

            zAng *= 2 * math.pi / 360    

            count += 1
            
            data.append([count, zAng])

    data = np.array(data)


    start = 92

    end = 225
    mean = np.mean(data[start:end,1])    
    

    t = data[:,0]
    y = data[:,1]

    meanArray = np.array([mean,mean])
    meanTime = np.array([0,count])

    print "Mean: " + str(mean)

    fig, ax = plt.subplots()
    ax.plot(t,y,'b', meanTime, meanArray, 'g')

    plt.xlabel('Count')
    plt.ylabel('Angular Speed (rad/s)')
    plt.title('Angular Speed vs. Count for Pulsewidth 7200')

    #ax.axis('equal')
    plt.show()
