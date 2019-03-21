#!/usr/bin/env python

import rospy
import rosbag
import sys

import phidget_spatial

import numpy as np
import matplotlib.pyplot as plt

if __name__ == '__main__':

    if len(sys.argv) != 2:
        print 'Usage: <bagfile>'
        exit()

    bag = rosbag.Bag(sys.argv[1], 'r')
    topics = ['/inertia']
    data = []
    size = 100
    kernel = np.ones(size)/size;
    count = 0
    for topic, msg, t, in bag.read_messages(topics=topics):
        if topic == "/inertia":
            count+=1
            data.append([count, msg.xAngular, msg.yAngular, msg.zAngular])

    data = np.array(data)
    xOutput = np.convolve(data[:,1],kernel,'same')
    yOutput = np.convolve(data[:,2],kernel,'same')
    zOutput = np.convolve(data[:,3],kernel,'same')
    
    start = 125
    end = 144

    xMean = np.mean(data[15000:,1])    
    xStd = np.std(data[15000:,1])
    yMean = np.mean(data[15000:,2])
    yStd = np.std(data[15000:,2])    
    zMean = np.mean(data[start:end,3])
    zStd = np.std(data[15000:,3])
    print "X Angular Mean", xMean,'\n'
    print "X Angular StdDev",xStd,'\n'
    print "Y Angular Mean",yMean,'\n'
    print "Y Angular StdDev",yStd,'\n'
    print "Z Angular Mean",zMean * (np.pi / 180),'\n'
    print "Z Angular StdDev",zStd,'\n'

    t = data[:,0]
    fig, ax = plt.subplots()
    ax.plot(t,xOutput,'b',t,yOutput,'g',t,zOutput,'r')
    #ax.axis('equal')
    plt.show()
