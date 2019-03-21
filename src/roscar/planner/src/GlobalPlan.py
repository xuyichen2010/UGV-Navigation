import numpy as np
import sys
import string
sys.path.append("/hom/reu/Desktop")
import utm

pointList = []
latitude = []
longitude = []

with open('GoodmanStraightLine.txt','r') as f:
    for line in f:
        if line:
            pointList.append(line.split())
            

for point in pointList:
    if(point):
        latitude.append(float(point[0]))
        longitude.append(float(point[1]))

print latitude
print longitude


pairs = zip(latitude, longitude)
U = []
# Converting Latitude/Longtitude to UTM
for a,b in pairs:
#    print a
#    print b
    U.append(utm.from_latlon(a,b))  # convert item a, b from pairs list to lat/lon coordinate
#     print str(U)
#    I.append(U)  # list I

target = open("goodmanParkingLotLineUTM.txt", 'w')  # Open up the file then write each line in list I
for line in U:
    
    target.write(str(line[0])+" "+ str(line[1])+"\n")


