#!/usr/bin/env python

import rospy
import rosbag
import sys

from geodesy import utm
import phidget_gps

import numpy as np
import matplotlib.pyplot as plt

import math

if __name__ == '__main__':

    if len(sys.argv) != 2:
        print 'Usage: <bagfile>'
        exit()

    bag = rosbag.Bag(sys.argv[1], 'r')
    topics = ['/gps_data']
    data = []
    for topic, msg, t, in bag.read_messages(topics=topics):
        if topic == "/gps_data":
            if msg.fix_status:
                utm_point = utm.fromLatLong(msg.latitude, msg.longitude)
                data.append([utm_point.easting, utm_point.northing])

    data = np.array(data)
    
    print data
    
    x1 = data[0][0]
    x2 = data[len(data)-1][0]
    y1 = data[0][1]
    y2 = data[len(data)-1][1]

    dist = math.sqrt( (x1-x2)**2 + (y1-y2)**2 )

    print "Start to end distance: " + str(dist) + "\n"

    fig, ax = plt.subplots()
    ax.scatter(data[:,0], data[:,1])
    ax.axis('equal')
    plt.show()

