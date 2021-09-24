// https://twitter.com/headcube/status/528187147543511041 (nv)
{var x =
 {arg j
 ;var y =
  {arg i
  ;1 / 4 ** i * (LFNoise0.kr(0.25 ** j / 8) > 0 - LFPulse.ar(2 ** i / 8, 0, 0.5)).abs}
 ;var f = 32 ** y.dup(10).sum * 30
 ;Pan2.ar(RLPF.ar(Pulse.ar(f, 0.3), f.sqrt.lag(2) * 30, 0.5), 0, 0.2)}
;x.dup(4).sum}
