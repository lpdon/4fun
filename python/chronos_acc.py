#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      Leandro
#
# Created:     18.08.2014
# Copyright:   (c) Leandro 2014
# Licence:     <your licence>
#-------------------------------------------------------------------------------

import serial
import struct
import array

##http://e2e.ti.com/support/microcontrollers/msp430/f/166/t/32714.aspx

##3. Send "Start Access Point" command
##packet: ff 07 03
##Response: ff 06 03
##
##4. Send the acc data request command
##packet : ff 08 07 00 00 00 00
##Response: ff 06 07 tt xx yy zz
##tt: data type (ff: no data, 01: valid acc data)

rf_COM_port = "COM5"

def send_start_access_point(rf_serial_connection):
    packet = [0xFF, 0x07, 0x03]
    response = [0xFF, 0x06, 0x03]

    #print array.array('B', [0xFF, 0x07, 0x03]).tostring()

    for i in packet:
        #print i
        #print struct.pack('B', i)
        #print str(struct.pack('B', i))
        #print struct.pack('B', str(i))
        #rf_serial_connection.write(struct.pack(str(i)))
        rf_serial_connection.write(struct.pack('B', i))

    for i in response:
        rx_byte = struct.unpack('B', rf_serial_connection.read())[0]
        if rx_byte <> i:
            return False

    return True

def send_acc_data_request(rf_serial_connection):
    packet = [0xFF, 0x08, 0x07, 0x00, 0x00, 0x00, 0x00]
    response = [0xFF, 0x06, 0x07, 0x01]

    for i in packet:
        rf_serial_connection.write(struct.pack('B', i))

    for i in response:
        rx_byte = struct.unpack('B', rf_serial_connection.read())[0]
        if rx_byte <> i:
            return False

    return True

def read_acc_data(rf_serial_connection):
    response = []

    for i in range(0, 3):
        response.append(struct.unpack('B', rf_serial_connection.read())[0])

    return response

rf_serial_conn = serial.Serial(rf_COM_port, 115200, timeout=1)

print rf_serial_conn

if send_start_access_point(rf_serial_conn):
    while True:
        if send_acc_data_request(rf_serial_conn):
            print read_acc_data(rf_serial_conn)


rf_serial_conn.close()