import numpy as np
import sys
import matplotlib.pyplot as plt

if len(sys.argv) < 2:
    print "ERROR: need filename\n"
    sys.exit()
else:
    filename = sys.argv[1]
    print "\nLoading " + str(filename) + "\n"

arr = np.loadtxt(filename)
zAngular = []
time = []

for line in arr:
    time.append(line[0])
    zAngular.append(line[1])

print arr

""" #Used to normalize data
firstNorth = northing[0]
firstEast = easting[0]

for i in range(len(northing)):
    northing[i] -= firstNorth
    easting[i] -= firstEast
"""
#plt.axis('equal')
plt.scatter(time,zAngular)
plt.ylabel('Z Angular Velocity')
plt.xlabel('time')
plt.show()


