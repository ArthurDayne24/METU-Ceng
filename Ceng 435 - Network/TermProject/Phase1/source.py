from socket import *

# This package allow us to send object through socket and
# convert our object to bytes then in the destination,
# decoding is done again and we get the object at the
# destination.
import pickle

# Library that is used get time in one server.
# We will use this in order to calculate end-to-end delay
import ntplib


# This is the class that sends its object to the broker with attributes data and time
class DataWithTime:
    def __init__(self, stringInput, sourceTime):
        self.data = stringInput
        self.sourceTime = sourceTime


# Broker address and port number decleration
serverName = '10.10.1.2'
# serverName = '127.0.0.1'
serverPort = 5005

# string data initialization for getting input
stringData = ""

# Creates new TCP socket (SOCK_STREAM is TCP socket type)
clientSocket = socket(AF_INET, SOCK_STREAM)

# Socket connects to the server with given ip and port
clientSocket.connect((serverName, serverPort))

# Always listen user to get input
while True:

    # Getting input from user
    stringData = input("Enter Input: ")

    # creating NTP Client to get time from server
    time = ntplib.NTPClient()

    # Getting time from URL
    response = time.request('tr.pool.ntp.org', version=3)

    # Encoding the input to send through socket
    stringData = stringData[0:1024].encode()

    # Creating dataWithTime object which will be sent to the broker
    dataWithTime = DataWithTime(stringData,response)

    # creating a pickle str to send objcet from socket
    packetToSend = pickle.dumps(dataWithTime)


    # Sending data to Broker.
    clientSocket.send(packetToSend)
