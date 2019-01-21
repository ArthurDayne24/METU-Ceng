import socket

# Creates 2 TCP/IP socket
# One for getting packets from broker and
# Other is for sending packets to the destination
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Server address and port initialization of router1
server_address = ('10.10.2.2', 5004)
# server_address = ('127.0.0.1', 5004)

# Bind the socket to the port so that
# Our socket connects with the port of the server
sock.bind(server_address)

# Prints which router is this program
print("Router : 1")

# Listen whenever the packets come from broker forever
while True:

    # Receive packets from broker
    data = sock.recv(1024)

    # Prints the packet
    print(data)

    # This is the address and port of the destination
    #   in order to send the given packet from broker to the destination
    server_address = ('10.10.3.2', 5001)
    # server_address = ('127.0.0.1', 5001)

    # Sending the gotten data to the destination with second socket
    sock2.sendto(data, server_address)
