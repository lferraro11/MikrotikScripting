:global lastHomeState;
:local currentHomeState;
:local message;
:local ipHome "192.168.85.2";
:local day [/system clock get value-name=date];
:local time [/system clock get value-name=time];

:if ([/ping $ipHome interval=1 count=20] = 0) do={
:set $currentHomeState "down";
} else={
:set $currentHomeState "up";
}

:if ($currentHomeState != $lastHomeState) do={
:set $lastHomeState $currentHomeState;
:if ($currentHomeState = "up") do={
:set $message ("\n$day - $time: Casa comenzo a responder nuevamente.");
} else={
:set $message ("\n$day - $time: Casa NO responde.");
}
/file set HouseStates contents=([get HouseStates contents] . $message);
}