import time
import socket
import socketserver
import threading
import os
import pickle
from threading import Timer

# Flag of making decision which router will be used to send packet
routerAlter = True

# These are the variables that are used to handle Go-Back-N algorithm
# Base is the expected Ack packet order
# Window size is maximum packet amount can be send at the same time
# Next Sequence number is the packet order which will be send next
base = 0
windowSize = 10
nextSeqNum = 0
packetCount = 0

# First all packets are received by broker than sent to destination.
# Therefore we need to store packets inside global array
allPackets = []

# These are the variables that are used to handle calculation of time-out.
timeoutInterval = 0.0
timeStart = 0.0
timeEnd = 0.0
beta = 0.25
alfa = 0.125
estimatedRTT = 0.0
sampleRTT = 0.0
timeoutlnterval = 0.2
devRTT = 0.0


# Simple lock in order to prevent race condition.
lock = threading.Lock()


# This function is used to calculate final time-out interval
def calculateInterval():
    global timeoutInterval, estimatedRTT, devRTT
    timeoutInterval = estimatedRTT + 4 * devRTT


# This function is used to calculate deviation between estimated RTT and sample RTT
def calculateDevRTT():
    global beta, devRTT, sampleRTT, estimatedRTT
    devRTT = (1 - beta) * devRTT + beta * (sampleRTT - estimatedRTT)

# This function simply calculates the estimated RTT
def calculateEstimated():
    global estimatedRTT, sampleRTT, alfa
    estimatedRTT = (1 - alfa) * estimatedRTT + alfa * sampleRTT


# When the time-out occurs, this function will be called by new thread.
# Starts new timer and make the next sequential number equal to the base.
# Simply makes the system sends the packets again
def timeoutCallback():
    global nextSeqNum, base, packetCount
    lock.acquire()
    packetCount = base
    nextSeqNum = base
    global s
    try:
        s.cancel()
    except:
        print("")
    calculateEstimated()
    calculateDevRTT()
    calculateInterval()
    s = Timer(timeoutlnterval , timeoutCallback)
    s.start()
    lock.release()

s = Timer(timeoutlnterval, timeoutCallback)


# This is the class that contains data, hashValue of data and sequence number and is transferred through sockets.
class DataPacket:
    def __init__(self, byteData, seqNumber, checksum):
        self.byteData = byteData
        self.seqNumber = seqNumber
        self.checksum = checksum


# This function is called by new thread itself whenever a UDP connection is established.
# Receiving acknowledge packets triggers this function.
# This is the place where decision of whether packets are sent successful or not is done.
class udpHandler(socketserver.BaseRequestHandler):
    def handle(self):
        global base, windowSize, nextSeqNum, allPackets, lock
        ackedNo = int(self.request[0].decode("UTF-8")[3:])

        # Locking is done in order to make operations in critical sections.
        # Other threads cannot reach below.
        lock.acquire()

        # If packed is successfully received, move the base by one so that new packets can be send to the destination.
        if base < ackedNo + 1:
            base = ackedNo + 1

        # If base and next sequence number are equal, stop the timer.
        if base == nextSeqNum:
            global s
            s.cancel()
        else:
            try:
                s.cancel()
            except:
                print("")

            # Calculate the time-out before starting timer.
            calculateEstimated()
            calculateDevRTT()
            calculateInterval()
            s = Timer(timeoutlnterval, timeoutCallback)
            s.start()

        print(" NextSeq-> ", nextSeqNum, " Base -> ", base, "AckedNo -> ", ackedNo)

        if base ==  5917:
            os._exit(0)

        # Releasing the lock is done in order to make operations in critical sections by other threads.
        # Other threads can reach below from now on.
        lock.release()

# Class of the UDP Server inherits from two class
class ThreadedUDPServer(socketserver.ThreadingMixIn,socketserver.UDPServer):
    pass


# This function is called by new thread itself whenever a TCP connection is established.
# Receiving packets from source triggers this function.
# This is the place where send the packets to the  destination.
class tcpHandler(socketserver.BaseRequestHandler):

    def handle(self):

        global allPackets, nextSeqNum, base, windowSize, lock, packetCount, routerAlter
        # flag = True
        packetCount = 0
        while True:
            # If last packet is received, break.
            # 5918 is the last packet's sequence number in our system.
            # And it only works for 5mb files.
            if packetCount == 5918:
                break
            else :
                data = self.request.recv(985)
                if len(data) == 0:
                    continue
                elif len(data) == 463 and packetCount != 5917:
                    data += self.request.recv(522)
                print("Received data length = ", len(data))

            # Adding the packet to the global array.
            allPackets.append(data)
            packetCount += 1
        print(packetCount)

        # Create new UDP socket in order to create connection between destination and itself.
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        # Initial sequence number.
        packetCount = 0

        while True:

            # Checking if broker is able to send packet while not exceeding the window size.
            if nextSeqNum - base >= windowSize:
                continue

            # Locking is done in order to make operations in critical sections.
            # Other threads cannot reach below.
            lock.acquire()


            if packetCount >= 5918:
                packetCount = 5917


            print(" Sent Packet Seq Num :  ", packetCount, " Base -> ", base, " Next Number : ", nextSeqNum)

            # If base and next sequence number are equal, stop the timer.
            if base == nextSeqNum:
                global s
                try:
                    s.cancel()
                except:
                    print("")

                # Calculate the time-out before starting timer.
                calculateEstimated()
                calculateDevRTT()
                calculateInterval()
                s = Timer(timeoutlnterval, timeoutCallback)
                s.start()


            print("Length of packet : ", len(allPackets[packetCount]))

            global timeStart

            # Start the time
            timeStart = time.time()

            # Sending packets are done in here
            if routerAlter:
                routerAlter = not routerAlter
                # sock.sendto(allPackets[packetCount], ("127.0.0.1", 5005))
                sock.sendto(allPackets[packetCount], ("10.10.3.2", 5005))
            else:
                routerAlter = not routerAlter
                sock.sendto(allPackets[packetCount], ("10.10.5.2", 5005))
            packetCount += 1
            nextSeqNum += 1

            # Releasing the lock is done in order to make operations in critical sections by other threads.
            # Other threads can reach below from now on.
            lock.release()

            # Sleeping is necessary in order to not to overload the destination's socket.
            time.sleep(0.01)


# Class of the TCP Server inherits from two class
class ThreadedTCPServer(socketserver.ThreadingMixIn,socketserver.TCPServer):
    pass


if __name__ == "__main__":

    # udpServer = ThreadedUDPServer(("127.0.0.1", 5006), udpHandler)

    # Creating Threaded UDP server is done here
    udpServer1 = ThreadedUDPServer(("10.10.4.1", 5006), udpHandler)
    udpServerThread1 = threading.Thread(target=udpServer1.serve_forever)
    udpServerThread1.daemon = True
    udpServerThread1.start()

    # Creating Threaded second UDP server is done here in order to handle two router
    udpServer2 = ThreadedUDPServer(("10.10.2.1", 5006), udpHandler)
    udpServerThread2 = threading.Thread(target=udpServer2.serve_forever)
    udpServerThread2.daemon = True
    udpServerThread2.start()



    # Creating Threaded TCP server is done here
    # tcpServer = ThreadedTCPServer(("127.0.0.1", 5002),tcpHandler)
    tcpServer = ThreadedTCPServer(("10.10.1.2", 5002),tcpHandler)
    tcpServerThread = threading.Thread(target=tcpServer.serve_forever)
    tcpServerThread.daemon = True
    tcpServerThread.start()

    input()

    # Closing the servers.
    tcpServer.shutdown()
    udpServer1.shutdown()
    udpServer2.shutdown()
    tcpServer.server_close()
    udpServer1.server_close()
    udpServer2.server_close()
