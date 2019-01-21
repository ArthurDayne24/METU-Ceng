import socketserver
import socket
import threading
import pickle
import hashlib
import os


# Broker addresses for two routers
# brokerAddress = ("127.0.0.1", 5006)
brokerAddress1 = ("10.10.2.1", 5006)
brokerAddress2 = ("10.10.4.1", 5006)

# Broker ip's and their port
listenerIP1 = "10.10.3.2"
listenerIP2 = "10.10.5.2"
listenerPort = 5005

# Flag of making decision which router will be used to send packet
routerAlter = True

# Decision flag in order to handle writing to new file at destination side.
writeFlag = True

# This is the next expected sequence number of next packet
mustReceived = 0

# Simple lock in order to prevent race condition.
lock = threading.Lock()

# First, all packets are stored which are sent by broker.
# Therefore we need to store packets inside global array with the size of packet number
allPackets = [b'']*5918


# This is the class that contains data, hashValue of data and sequence number and is transferred through sockets.
class DataPacket:
    def __init__(self, byteData, seqNumber, hashValue):
        self.byteData = byteData
        self.seqNumber = seqNumber
        self.hashValue = hashValue


# Writing the gotten packets to the destination side is done in this function.
# It writes the output to the "output.txt"
def writeToFile():
    global writeFlag
    if writeFlag:
        file = open("output.txt", "wb")
        writeFlag = False
        for i in range(0, len(allPackets)):
            file.write(allPackets[i])
        file.close()


# This function is called by new thread itself whenever a UDP connection is established.
# Receiving packets from broker triggers this function.
# This is the place where decision of whether expected packet is received or not.
class ThreadedUDPRequestHandler(socketserver.BaseRequestHandler):

    def handle(self):

        global lock, mustReceived, routerAlter

        # Locking is done in order to make operations in critical sections.
        # Other threads cannot reach below.
        lock.acquire()

        # Gets the received data from socket
        data = self.request[0]

        print("Length of Data : ",  len(data))

        while True:
            try:
                # Turns the bytes to the DataPacket object
                receivedPacket = pickle.loads(data)
                break
            except:
                continue

        # Creates new UDP socket in order to communicate with broker.
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        print("Received Checksum   :  -->> " ,receivedPacket.hashValue)
        print("Calculated Checksum :  -->> " ,hashlib.md5(receivedPacket.byteData).hexdigest())

        # Checks whether received packet is expected packet and it is not corrupted.
        if int(receivedPacket.seqNumber) == mustReceived and receivedPacket.hashValue == hashlib.md5(receivedPacket.byteData).hexdigest():

            print("Received Packet : ", int(receivedPacket.seqNumber) , "Needed Packet : ", mustReceived, " ACKED : ", mustReceived)

            # Stores to the global
            allPackets[int(receivedPacket.seqNumber)] = receivedPacket.byteData

            # Sending ACK to the broker is done here
            if routerAlter:
                sock.sendto(("ACK" + str(mustReceived-1)).encode(), brokerAddress1)
                routerAlter = not routerAlter
            else:
                sock.sendto(("ACK" + str(mustReceived-1)).encode(), brokerAddress2)
                routerAlter = not routerAlter

            sock.close()

            # Since it is successful receiving, we increase the next expected packet sequence number.
            mustReceived += 1

            # If the last packet is received, write data's to the file.
            if mustReceived == 5918:
                writeToFile()
                os._exit(1)

        else:

            print("Not Needed Packet : ", int(receivedPacket.seqNumber), " ACKED : ", mustReceived-1)

            # If the received packet is not the expected packet, send the last ACK'ed packet's sequence number.
            if routerAlter:
                sock.sendto(("ACK" + str(mustReceived-1)).encode(), brokerAddress1)
                routerAlter = not routerAlter
            else:
                sock.sendto(("ACK" + str(mustReceived-1)).encode(), brokerAddress2)
                routerAlter = not routerAlter

            sock.close()

        # Releasing the lock is done in order to make operations in critical sections by other threads.
        # Other threads can reach below from now on.
        lock.release()


# Class of the UDP Server inherits from two class
class ThreadedUDPServer(socketserver.ThreadingMixIn, socketserver.UDPServer):
    pass


if __name__ == "__main__":

    # Creating Threaded UDP server is done here
    udp_server_1 = ThreadedUDPServer((listenerIP1, listenerPort), ThreadedUDPRequestHandler)
    udp_server_thread_1 = threading.Thread(target=udp_server_1.serve_forever)
    udp_server_thread_1.daemon = True
    udp_server_thread_1.start()

    # Creating Threaded second UDP server is done here in order to handle two router
    udp_server_2 = ThreadedUDPServer((listenerIP2, listenerPort), ThreadedUDPRequestHandler)
    udp_server_thread_2 = threading.Thread(target=udp_server_2.serve_forever)
    udp_server_thread_2.daemon = True
    udp_server_thread_2.start()

    input()
    udp_server_1.shutdown()
    udp_server_1.server_close()

    udp_server_2.shutdown()
    udp_server_2.server_close()
