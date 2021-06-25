// RBezier - dynamic shifting of control points, as oscillator
{var w = {arg l, r; LFDNoise3.ar(freq: 2).range(lo: l, hi: r)}
;Mix.fill(4,
 {var p = [0,0,w.(0.05,0.25),-1.3,w.(0.25,0.45),-1.3,0.5,0,w.(0.55,0.75),1.3,w.(0.75,0.95),1.3,1,0]
 ;var o = RBezier.ar(freq: w.(200,205), phase: 0, param: p)
 ;Pan2.ar(in: o, pos: IRand.new(lo: -1, hi: 1), level: 0.1)})}
