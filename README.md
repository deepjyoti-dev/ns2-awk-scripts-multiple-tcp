📡 NS-3 FTP over TCP Simulation (5 Nodes)

This NS-3 simulation models FTP traffic over TCP in a simple 5-node network with sources, a gateway, and a receiver. It demonstrates traffic flow, trace analysis, and visualization using NAM.

✅ Simulation Overview
Component	Details
Nodes	5 nodes: s1, s2, s3 (sources), g (gateway), r (receiver)
Traffic Type	FTP over TCP from all 3 sources
Topology	Each source connects to g; g connects to receiver r
Trace Files	exp5.tr (trace) and 1exp5.nam (NAM visualization)
Visualization	NAM used to display flow topology and packet transmissions
🔧 How to Run

Navigate to your NS-3 directory:

cd ~/ns-allinone-3.xx/ns-3.xx/


Save the simulation script as ftp_5nodes.cc or ftp_5nodes.py.

Build and run the simulation:

./waf --run "ftp_5nodes"


Open NAM visualization:

nam 1exp5.nam

📊 Output / Analysis

Trace File (exp5.tr) contains packet-level details:

Sent/received packets

Packet size and timestamps

Source and destination nodes

NAM File (1exp5.nam) shows:

Node positions

Flow of FTP traffic

TCP congestion and acknowledgments visually

🧠 Notes

Adjust TCP parameters (window size, segment size) for performance testing.

Use FlowMonitor or pcap traces for detailed throughput and delay analysis.

NAM provides a visual understanding of packet flow and congestion.

🏷️ Tags

#ns3 #TCP #FTP #simulation #network #nam #trace #5nodes #topology #packetflow
