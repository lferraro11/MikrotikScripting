:local Ip1 "192.168.0.1";
:local Ip2 "192.168.0.2";
:local Mac1 "XX:XX:XX:XX:XX:XX";
:local Mac2 "XX:XX:XX:XX:XX:XY";
:local PingCount "15";
:if ([/ping $Ip1 interval=1 count=$PingCount] = 0) do={
/interface bridge port set [find where interface="eoip-tunel-1"] disabled=no;
}
:if ([/ping $Mac1 interface=ether3 interval=1 count=$PingCount] > 0) do={
/interface bridge port set [find where interface="eoip-tunel-1"] disabled=yes;
}
:delay 15s;
:if ([/ping $Ip2 interval=1 count=$PingCount] = 0) do={
/interface bridge port set [find where interface="eoip-tunel-2"] disabled=no;
}
:if ([/ping $Mac2 interface=ether3 interval=1 count=$PingCount] > 0) do={
/interface bridge port set [find where interface="eoip-tunel-2"] disabled=yes;
}
