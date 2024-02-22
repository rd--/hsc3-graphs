// narrow band filtered crackle noise (jmcc) #2 ; texture=spawn,2,inf
var e = Env.linen(2, 5, 2);
var rf1 = Rand(0, 2000) + 80;
var rf2 = rf1 + (Rand(-0.2, 0.2) * rf1);
var rf = XLine.kr(rf1, rf2, 9);
var c = Crackle.ar(1.97 + Rand(0, 0.03)) * 0.15;
Pan2.ar(Resonz.ar(c, rf, 0.2), Rand(-1, 1), EnvGen.ar(e, 1, 1, 0, 1, 2))
