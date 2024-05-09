import random
import math
import time
import logging
from scapy.all import *

lambda_arrival = 2  # Intensity of arrivals (packets per second)
lambda_length = 0.002  # Intensity of length (packets per byte) thus average length 1/lambda_length

def generate_packet_length():
    return int(-math.log(1.0 - random.random()) / lambda_length)

# Generates packets with exponential distributed inter-arrival time and length
def generate_packets():
    logging.getLogger("scapy").setLevel(logging.CRITICAL)

    generated_packets = 0
    generated_bytes = 0

    while True:
        interarrival_time = random.expovariate(lambda_arrival)
        time.sleep(interarrival_time)
        
        packet_length = generate_packet_length()
        packet_data = bytearray(random.getrandbits(8) for _ in range(packet_length))

        # UDP packet creation with SCAPY
        packet = IP(dst="10.0.2.2")/Ether(type=0x0800)/Raw(load=packet_data)
        
        # Send packet using SCAPY
        send(packet, iface="enp0s3", verbose=False)

        generated_packets = generated_packets + 1
        generated_bytes = generated_bytes + packet_length
        generated_average_length = str("{:.2f}".format(generated_bytes / generated_packets))

        print("Actual packet " + str(packet_length) + " bytes - current average length: " + generated_average_length + " bytes")

# Avvia la generazione dei pacchetti
print("Expected average packet length:", 1/lambda_length)
generate_packets()

