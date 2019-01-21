import socket
import pickle

# Library that is used get time in one server.
# We will use this in order to calculate end-to-end delay
import ntplib

# Address of the destination and its port
# server_address = ('127.0.0.1', 5001)
server_address = ("10.10.3.2", 5001)

# Pakcet class must be delared in the destination in order to
# convert bytes to the packet object
class Packet:
    def __init__(self, stringInput, dataOrder, dataLength, groupID, sourceTime):
        self.data = stringInput
        self.order = dataOrder
        self.length = dataLength
        self.groupID = groupID
        self.sourceTime = sourceTime

# Our results will be gathered here
# It is nested result array since we can get multiple input
arrayOfPackets = [[]]

# Opens a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Socket connects with the given server
sock.bind(server_address)

# creating NTP Client to get time from server
time = ntplib.NTPClient()


# Receive forever
while True:

    # Gets packets from routers
    data, address = sock.recvfrom(4096)

    # This is the part where converting is done from bytes to the object
    receivedData = pickle.loads(data)

    # Calculate the end-to-end time of first packet arrived
    if receivedData.order == 0:
        # Getting time from URL
        response = time.request('tr.pool.ntp.org', version=3)
        print("End-to-end Delay : " + str(response.tx_time - receivedData.sourceTime.tx_time))

    # This statement looks if it is the new input
    if len(arrayOfPackets) < receivedData.groupID + 1:
        # If it is, insert new array to the result array in order to be able to insert packets
        while len(arrayOfPackets) != receivedData.groupID+1:
            arrayOfPackets.append([])
    # Inserts the new packet to the result array
    arrayOfPackets[receivedData.groupID].append(receivedData)

    # Statement of whether all packets are gathered from 1 input
    if len(arrayOfPackets[receivedData.groupID]) == receivedData.length:

        # If they are gathered, sort them with respect to their packet order
        arrayOfPackets[receivedData.groupID].sort(key=lambda x: x.order)

        # And then print the all packets' data
        for i in range (0, receivedData.length):
            print(arrayOfPackets[receivedData.groupID][i].data.decode(),end='')

        # Since all data is gathered, emoty the result array
        arrayOfPackets[receivedData.groupID] = []

    # Print new line to not be confused
    print("")
