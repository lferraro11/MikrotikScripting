:local HOST "192.168.0.1";
:local LOOPBACK "10.0.0.1";
:local PINGCOUNT "7";
:local INT "bridge-loopback";
:local DELAY "10s";
:if ([/ping $HOST src-address=$LOOPBACK interval=1 count=$PINGCOUNT] = 0) do={
:log error ("Host $HOST no responde a través de la IPSec");
/ip ipsec remote-peers kill-connections;
:log warning ("Restableciendo tunel IPSec...");
:delay $DELAY;
}
