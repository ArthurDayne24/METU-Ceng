import socket
import socketserver
import threading

# This package allow us to send object through socket and
# convert our object to bytes then in the destination,
# decoding is done again and we get the object at the
# destination.
import pickle

# Routers addresses and their connection ports

router1IP = "10.10.2.2"
router2IP = "10.10.4.2"
# router1IP = '127.0.0.1'
# router2IP = '127.0.0.1'
r1Address = (router1IP, 5004)
r2Address = (router2IP, 5005)

# packet order number to order packets at destination
orderID = 0

# It is used for sending packets through different routers
routerAlter = True

# Thread class that inherits sour server and thread
class ThreadedTCPServer(socketserver.ThreadingMixIn,socketserver.TCPServer):
    pass



# This is the class that sends its object to the broker with attributes data and time
# This is required here to understand what is sent to the broker.
class DataWithTime:
    def __init__(self, stringInput, sourceTime):
        self.data = stringInput
        self.sourceTime = sourceTime


# Packet class is sent through sockets
# It provides input with size 128 byte,
#   Order of the packet in the input,
#   Number of the packets in that input and
#   Order of the input
class Packet:
    def __init__(self, stringInput, dataOrder, dataLength, groupID, sourceTime):
        self.data = stringInput
        self.order = dataOrder
        self.length = dataLength
        self.groupID = groupID
        self.sourceTime = sourceTime

# This is the thread handler which listen request to given port and ip at the initial time
class tcpHandler(socketserver.BaseRequestHandler):

    # all requests invokes the handle(self) function
    def handle(self):
        # initial input order
        groupID = 0

        while True:
            # Gets the input from source
            dataWithTime = self.request.recv(1024)

            # In order to convert bytes to DataWithTime object
            # pickle module is used
            dataClass = pickle.loads(dataWithTime)

            # initialization of user input from attribute
            data = dataClass.data
            # initialization of source time from attribute
            sourceTime = dataClass.sourceTime
            # Length of the input
            dataLen = len(data)

            # Printing recieved input
            print(data)

            # first packet order is 0
            orderID = 0

            # if input is -1, break the while loop
            if(data == "-1"):
                break

            # Creates new UDP socket to send packet to the routers
            sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

            # Initial router is router1 by setting it True
            # First packet will be send through router1
            routerAlter = True

            # In this part, we decide how many packet will be sent
            # It wil be used to understand when sending whole input
            #   is done
            lengthOfData = int(dataLen/128) + 1

            # Temp length in order to send all the packets
            # It will be decreased when a pakcet is sent
            remainingPacket = lengthOfData

            # This is the pointer which shows the place where the
            #   last data was sent
            # It is used to packetize input to 128 bytes packets
            # Initial is 0
            dataPointer = 0

            # Sending packets till the last packet is sent
            # There will be no remaining packet
            while remainingPacket != 0:

                # Decision of which router will be used
                if routerAlter:
                    # ROUTER 1

                    # Input is got from pointer to the pointer + 128
                    # And then pakcet object is initialized with that string, order of packet
                    #   number of packets and order of input.
                    packet = Packet(data[dataPointer:dataPointer+128], orderID, lengthOfData, groupID, sourceTime)

                    # Pickle package is used to transform object to the bytes
                    #   in order to send object thorugh socket
                    packetToSend = pickle.dumps(packet)

                    # Sending packet through to the router1
                    sock.sendto(packetToSend, r1Address)
                else:
                    # ROUTER 2

                    # Input is got from pointer to the pointer + 128
                    # And then pakcet object is initialized with that string, order of packet
                    #   number of packets and order of input.
                    packet = Packet(data[dataPointer:dataPointer+128], orderID, lengthOfData, groupID, sourceTime)

                    # Pickle package is used to transform object to the bytes
                    #    in order to send object thorugh socket
                    packetToSend = pickle.dumps(packet)

                    # Sending packet through to the router1
                    sock.sendto(packetToSend, r2Address)

                # Change the destination (router) of next packet
                routerAlter = not (routerAlter)

                # Decrease the remaining packet number to break the loop
                remainingPacket -= 1

                # packet order is increased
                orderID += 1

                # Pointer is increased to get next 128 byte in the input
                dataPointer += 128

            # Increasing the next input order id
            groupID += 1


# It is invoked when program is started
if __name__ == "__main__":

    # This is the initialization of the server by giving address and port of server and
    #   corresponding Handler class which is declared at the top
    tcpServer = ThreadedTCPServer(('10.10.1.2', 5005),tcpHandler)

    # This is the part where thread is connected with server and
    #   gets all the requests which is sentto this server by thread handler
    tcpServerThread = threading.Thread(target=tcpServer.serve_forever)

    # Threads will stop if our program is shutted down
    # True flag provide this
    tcpServerThread.daemon = True

    # Thread start to listen the port of server with given IP.
    tcpServerThread.start()

    # Wait for action to close the server
    input()

    # Close the TCP connection gracefully after
    tcpServer.shutdown()
    tcpServer.server_close()
