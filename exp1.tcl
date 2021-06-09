set ns [new Simulator]

set f [open exp5.tr w]

$ns trace-all $f

set nf [open 1exp5.nam w]

$ns namtrace-all $nf

 

proc finish {} {

global ns nf f

$ns flush-trace

close $nf

close $f

exec nam 1exp5.nam &

exit 0

}

#color

$ns color 1 Blue
$ns color 2 Red
$ns color 3 Green


#Create three nodes
set r [$ns node]
set s1 [$ns node]
set s2 [$ns node]
set s3 [$ns node]
set g [$ns node]

#Create links between the nodes
$ns duplex-link $s1 $g 2Mb 10ms DropTail
$ns duplex-link $s2 $g 2Mb 10ms DropTail
$ns duplex-link $s3 $g 2Mb 10ms DropTail
$ns duplex-link $g $r 2Mb 10ms DropTail

#position

$ns duplex-link-op $s1 $g orient left-up
$ns duplex-link-op $s2 $g orient left-down
$ns duplex-link-op $s3 $g orient right-up



#Setup a TCP connection between nodes s1 and r
set tcp1 [new Agent/TCP]
$tcp1 set segmentSize- 1000
$tcp1 set class_ 2
$ns attach-agent $s1 $tcp1
set sink1 [new Agent/TCPSink]
$ns attach-agent $r $sink1
$ns connect $tcp1 $sink1
$tcp1 set fid_ 1

#Setup a TCP connection between nodes s2 and r
set tcp2 [new Agent/TCP]
$tcp2 set segmentSize- 1000
$tcp2 set class_ 3
$ns attach-agent $s2 $tcp2
set sink2 [new Agent/TCPSink]
$ns attach-agent $r $sink2
$ns connect $tcp2 $sink2
$tcp2 set fid_ 2

#Setup a TCP connection between nodes s3 and r
set tcp3 [new Agent/TCP]
$tcp3 set segmentSize- 1000
$tcp3 set class_ 4
$ns attach-agent $s3 $tcp3
set sink3 [new Agent/TCPSink]
$ns attach-agent $r $sink3
$ns connect $tcp3 $sink3
$tcp3 set fid_ 3




#Setup a FTP over TCP connection
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ftp1 set type_ FTP

#Setup a FTP over TCP connection
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ftp2 set type_ FTP

#Setup a FTP over TCP connection
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ftp3 set type_ FTP



#schedule events for the ftp  agents
$ns at 1.0 "$ftp1 start"
$ns at 3.0 "$ftp1 stop"



#schedule events for the ftp  agents
$ns at 2.0 "$ftp2 start"
$ns at 6.0 "$ftp2 stop"

#schedule events for the ftp  agents
$ns at 2.0 "$ftp3 start"
$ns at 9.0 "$ftp3 stop"



#Call the finish procedure after 5 seconds of simulation time
$ns at 20.0 "finish"


#Run the simulation
$ns run



























































