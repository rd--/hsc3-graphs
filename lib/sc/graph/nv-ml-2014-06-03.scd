// https://twitter.com/headcube/status/474064500564324352 (nv)
{Splay.ar(
{var f = product({|i| product({LFPulse.ar(2**rrand(-9,1),2.rand/2)}!(i+2))/(1+i)+1}!8) * 86
;Pluck.ar(BPF.ar(f,f).sin,Saw.ar,1,1/f,9)}!9) * 0.2}.play
