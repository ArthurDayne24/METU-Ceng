import sys
from socket import *
import pickle
import hashlib
import time

# This is the class that contains data, hashValue of data and sequence number and is transferred through sockets.
class DataPacket:
    def __init__(self, byteData, seqNumber, hashValue):
        self.byteData = byteData
        self.seqNumber = seqNumber
        self.hashValue = hashValue


# Ip of the server
serverName = "10.10.1.2"
# serverName = "127.0.0.1"
serverPort = 5002

# File that we transfer got from system arguments
fileName = sys.argv[1]
file = open(fileName, "rb")

# Tcp socket which allows us to communicate between broker and source
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName, serverPort))

# initial data of file
readData = file.read(845)

# incremental sequence number
# initially 0
seqNumber = 0

# while file is not empty
while readData:

    # Takes the md5sum of file
    hashValue = hashlib.md5(readData).hexdigest()

    # We place sequence number as 4 digit and put it into object.
    # 0's is used to make the each packet size stabile
    if seqNumber < 10:
        packet = DataPacket(readData, "000" + str(seqNumber), hashValue)
    elif seqNumber < 100:
        packet = DataPacket(readData, "00" + str(seqNumber), hashValue)
    elif seqNumber < 1000:
        packet = DataPacket(readData, "0" + str(seqNumber), hashValue)
    else:
        packet = DataPacket(readData,  str(seqNumber), hashValue)

    # Pickling the packet in order to send through socket
    # Pickle makes the object to the byte version in order to send it.
    packetToSend = pickle.dumps(packet)
    print("Packet Number : " + str(seqNumber) + " Packet Len : " + str(len(packetToSend)))

    # Sending through socket
    clientSocket.send(packetToSend)

    # increment the seq number for next packet
    seqNumber += 1

    # Sleeping is necessary in order to not to overload the broker's socket.
    time.sleep(0.01)

    # Read next packet
    readData = file.read(845)

