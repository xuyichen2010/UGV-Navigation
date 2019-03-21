### Purpose of this is to plot the range versus intensity for our white piece of reflective tape.  From this we can find a best fit curve for normalizing the intensity over range so that all points can be compared to a common threshhold.  ###

#!/usr/bin/env python

import rospy
import rosbag
import sys
import math

import utm_laser

import numpy as np
import matplotlib.pyplot as plt

if __name__ == '__main__':

	if len(sys.argv) != 2:
        	print 'Usage: python intensity_vs_range.py <bagfile>'
        	exit()
	
	bag = rosbag.Bag(sys.argv[1], 'r')
	d_range_quad = []
	d_intensity_quad = []
	d_range_lin = []
	d_intensity_lin = []
	topics = ['intensity_exp']

	for topic, msg, t, in bag.read_messages(topics=topics):
		if topic == "intensity_exp":
			#throw out data where tape is not recognized
			if msg.intensity > 10000.:
				if msg.range < 0.6: #seperate linear and quad.
					d_range_lin.append(msg.range)
					d_intensity_lin.append(msg.intensity)
				else:
					d_range_quad.append(msg.range)
					d_intensity_quad.append(msg.intensity)
			else:
				continue
	bag.close()

	x_lin = d_range_lin
	y_lin = d_intensity_lin
	x_quad = d_range_quad
	y_quad = d_intensity_quad

	#plot data and fit to linear regression
	z1 = np.polyfit(x_lin, y_lin, 1)
	p1 = np.poly1d(z1)
	#print equation based on constants
	print "y = %.6fx + %.6f"%(z1[0],z1[1])

	#plot data and fit to quadratic regression
	z2 = np.polyfit(x_quad, y_quad, 2)
	p2 = np.poly1d(z2)
	plt.plot(x_lin,y_lin,"b-",x_quad,y_quad,"b-",x_lin,p1(x_lin),"r--", x_quad, p2(x_quad), "g--")
	#plt.scatter(x,y)
	#print equation based on constants
	print "y = %.6fx^2 + %.6fx + %.6f"%(z2[0],z2[1],z2[2])
	plt.xlabel('Range (m)')
	plt.ylabel('Intensity')
	plt.show()

	
