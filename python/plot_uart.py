#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      Leandro
#
# Created:     10.08.2014
# Copyright:   (c) Leandro 2014
# Licence:     <your licence>
#-------------------------------------------------------------------------------

import matplotlib.pyplot as plt
import matplotlib.animation as animation
import math
import numpy as np
import time
import serial
import struct


y = [0.0] * 50
x = np.arange(0, len(y))

def update(line):
    lsb = ser.read()
    msb = ser.read()
    adc = (struct.unpack('B', msb)[0] << 8) | struct.unpack('B', lsb)[0]
    #adc = struct.unpack('B', value)
    #print adc[0]
    y.pop(0)
    #y.append(adc[0])
    y.append(adc)
    print y
    line.set_ydata(y)
    plt.ylim(0, max(y))

ser = serial.Serial('COM12', 115200)

fig = plt.figure()
line = plt.plot(x, y)
#plt.ylim(0, 4100)
anim = animation.FuncAnimation(fig, update, line, interval=1)
plt.show()
plt.close()
ser.close()
