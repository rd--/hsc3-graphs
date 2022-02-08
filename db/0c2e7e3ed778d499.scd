// RBezier ; event control
{var voiceFunc =
 {arg e
 ;var w = {arg l, r; LFDNoise3.ar(freq: e.rx * 5).range(lo: l, hi: r)}
 ;Mix.fill(4,
  {var p = [0,0,w.value(0.05,0.25),-1.3,w.value(0.25,0.45),-1.3,0.5,0,w.value(0.55,0.75),1.3,w.value(0.75,0.95),1.3,1,0]
  ;var o = RBezier.ar(freq: w.(200,205) * (e.x + 0.5), phase: 0, param: p)
  ;Pan2.ar(in: o, pos: e.o * 2 - 1, level: e.z * LagUD.kr(in: e.w, lagTimeU: 0.01, lagTimeD: e.y * 4))})}
;Mix.ar(Voicer.ar(numVoices: 4, voiceFunc: voiceFunc))}
