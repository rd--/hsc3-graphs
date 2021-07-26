// https://twitter.com/headcube/status/528187147543511041 (nv)
{var x =
 {arg j
 ;{var y =
   {arg i
   ;1 / 4 ** i * (LFNoise0.kr(0.25 ** j / 8) > 0 - LFPulse.ar(2 ** i / 8)).abs}
  ;var f = 32 ** (y ! 10).sum * 30
  ;RLPF.ar(Pulse.ar(f,0.3),f.sqrt.lag(2) * 30,0.5) ! 2 / 5}}
;(x ! 4).sum}
