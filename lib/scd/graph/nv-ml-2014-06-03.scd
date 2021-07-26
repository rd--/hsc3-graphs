// https://twitter.com/headcube/status/474064500564324352 (nv)
{Splay.ar(
{var f = ({arg i; ({LFPulse.ar(2 ** -9.rrand(1), 2.rand / 2)} ! (i + 2)).product / (1 + i) + 1} ! 8).product * 86
;Pluck.ar(BPF.ar(f,f).sin,Saw.ar,1,1/f,9)} ! 9) * 0.2}
