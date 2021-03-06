:local Ip1 "192.168.0.1";
:local Ip2 "192.168.0.2";
:local StateTunnel1 [/interface bridge port get [find where interface="eoip-tunel-1"] value-name=disabled];
:local StateTunnel2 [/interface bridge port get [find where interface="eoip-tunel-2"] value-name=disabled];
:local PingCount "15";
:if ([/ping $Ip1 interval=1 count=$PingCount] = 0) do={
:if ($StateTunnel1 = true) do={
/interface bridge port set [find where interface="eoip-tunel-1"] disabled=no;
} else={
/interface bridge port set [find where interface="eoip-tunel-1"] disabled=yes;
}
}
:if ([/ping $Ip2 interval=1 count=$PingCount] = 0) do={
:if ($StateTunnel2 = true) do={
/interface bridge port set [find where interface="eoip-tunel-2"] disabled=no;
} else={
/interface bridge port set [find where interface="eoip-tunel-2"] disabled=yes;
}
}
