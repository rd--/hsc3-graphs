// https://twitter.com/headcube/status/528187147543511041 (nv)

{var x =
 {arg j
 ;{var y =
   {arg i
   ;1 / 4 ** i * abs(LFNoise0.kr(0.25 ** j / 8) > 0 - LFPulse.ar(2 ** i / 8))}
  ;var f = 32 ** sum(y ! 10) * 30
  ;RLPF.ar(Pulse.ar(f,0.3),f.sqrt.lag(2) * 30,0.5) ! 2 / 5}}
;sum(x ! 4)}.play
