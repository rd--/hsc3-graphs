// https://twitter.com/headcube/status/474064500564324352 (nv)
{var o = {arg i; ({LFPulse.ar(2 ** -9.rrand(1), 2.rand / 2, 0.5)}.dup(i + 2)).product / (1 + i) + 1}
;var z = {var f = (o.dup(8)).product * 86; Pluck.ar(BPF.ar(f, f, 1).sin,Saw.ar(440), 1 , 1 / f, 9, 0.5)}
;Splay.ar(z.dup(9)) * 0.2}
