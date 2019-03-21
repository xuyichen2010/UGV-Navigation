### Purpose of this is to emulate the motion we expect our global planner to perform. Our laser wrapper exports relative x and y coordinates that this planner will take in for a changing goal.  Each goal instance will be approached with a cost function using sample and predict.  ###

#!/usr/bin/env python

import rospy
import rosbag
import sys
import math

import utm_laser

import numpy as np
import matplotlib.pyplot as plt

#function takes in x and y coordinates and converts to polar (radius and theta) as a tuple
def rectangularToPolar(x,y):
	r = math.sqrt( x*x + y*y)
	theta = math.atan2( y,x )  # -pi to pi
	return (r, theta)
#function takes in radius and theta and converts to tuple (x,y) coords
def polarToRectangular(radius, theta):
	x = radius * math.cos(theta)
	y = radius * math.sin(theta)
	return (x,y)	

#takes in radians and computes the sin^2(x) using a double angle formula, outputs a ratio
def sinSquared(radians):
	return (1 - math.cos(2*radians)) / 2

#computes the distance between two points on a cartesian 2D plane
def distanceFn(x1, y1, x2, y2):
	return math.sqrt( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) )

if __name__ == '__main__':
	''' ///////////////////// Set Params //////////////////////// '''
	GOAL_RADIUS = 1.0 #meters (roe desired)
	VEL_RATIO = 0.5 # 1/s (constant ratio for v desired)
	TIME_HORIZON = 1.0 #s (projection time)
	TIME_SLICE = 0.05 #s (time projection resolution)
	RADIUS_MIN = 0.5 #m
	OMEGA_RESOLUTION = 0.1 #rads
	COST_CONST_K = 2

	''' ////////// Take in X and Y relative Coordinates ///////// '''
	#Dummy data
	#target_coords = [(3.22,2.56), (-4.00,1.56), (3.00,-4.00)]
	target_coords = [(3.22,2.56)]	
	polar_coords = [rectangularToPolar(coord[0],coord[1]) for coord in target_coords]
	#Adding tolerances to goals
	fig, ax = plt.subplots()	
	for coord in target_coords:
		circle = plt.Circle(coord, GOAL_RADIUS, color='blue', fill=False)
		ax.add_artist(circle)
	#Plot origin
	circle = plt.Circle((0,0), 0.2, color='green', fill=True)
	ax.add_artist(circle)
	#Plot goalpoints with radius
	easting,northing = zip(*target_coords)
	plt.scatter(easting,northing, color='red')
	''' //////////////// Loop Emulating SAMPLE_RATE ////////////////  '''
	command_velocity = 0.0	#velocity to send to robot
	command_theta = 0.0	#theta to send to robot
	for coord in target_coords:
		polar_coord = rectangularToPolar(coord[0],coord[1])
		print(coord)
		#adjust target coord based on edge of goal radius
		radius_target = polar_coord[0] - GOAL_RADIUS;
		theta_target = polar_coord[1];
		target_coord = polarToRectangular(radius_target, theta_target)
		#plot new target point to compensate for goal radius
		plt.scatter(target_coord[0], target_coord[1], color='red', s=100)
		#Compute command velocity 
		command_velocity = VEL_RATIO * radius_target 
		#compute omega range from V
		omega_max = command_velocity / RADIUS_MIN
		#sample and project distance while minimizing cost
		bestCost = 1000000.

		bestX = 0	#for plotting 
		bestY = 0	#for plotting
		bestTheta = 0	#for plotting

		command_omega = 0.
		projected_coords = []
		GRAPH_ADJUSTMENT = 1.571
		#iterate over possible angular speeds
		omega = -1*omega_max
		while omega <= omega_max:
			#step through time with linear approximations to get a curve
			x = 0
			y = 0
			theta = math.pi/2  #graph adjustment TODOOOO
			for i in range(0, int(TIME_HORIZON/TIME_SLICE)):
				x = x + command_velocity*math.cos(theta)*TIME_SLICE
				y = y + command_velocity*math.sin(theta)*TIME_SLICE
				theta = theta + omega*TIME_SLICE
				projected_coords.append((x,y))
			#cost function is distance between projection and person, look into tolerance ring, also incorporate robot theta 
			#cost = distanceFn(x, y, target_coord[0], target_coord[1])
			cost = COST_CONST_K*sinSquared((theta_target - theta)/2) + distanceFn(x, y, target_coord[0], target_coord[1])

		 	#compare costs to minimize
			if(cost < bestCost):
				bestCost = cost
				command_omega = omega
				bestX = x
				bestY = y
				bestTheta = theta
			omega += OMEGA_RESOLUTION
				 
					

		#Plot goalpoints with radius
		easting,northing = zip(*projected_coords)
		plt.scatter(easting,northing, color='purple')

		plt.scatter(bestX, bestY, color='red', s=100)	
	
		print('command velocity: ')
		print(command_velocity)
		print('command omega: ')
		print(command_omega)
		print('best theta: ')
		print(bestTheta)
		print('min cost: ')
		print(bestCost)
		print()

	''' /////////////// Produce plot ////////////////////// '''
	
    	plt.xlabel('Easting (m)')
    	plt.ylabel('Northing (m)')
	plt.show()
