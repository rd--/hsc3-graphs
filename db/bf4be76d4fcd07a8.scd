// resonant dust (jmcc) #2 ; texture=spawn,2,inf
var e = Env.linen(2, 5, 2, 1, 'lin');
var rf1 = Rand.ir(0, 2000) + 80;
var rf2 = rf1 + (Rand.ir(-0.5, 0.5) * rf1);
var d = Dust.ar(50 + Rand.ir(0, 800)) * 0.3;
var s = Resonz.ar(d, XLine.kr(rf1, rf2, 9), 0.1);
Pan2.ar(s, Rand.ir(-1, 1), EnvGen.ar(e, 1, 1, 0, 1, 2))
