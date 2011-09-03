var e = Env.linen(2,5,2);
var o = FSinOsc.ar(2000.0.rand,EnvGen.kr(e,1,0,0.02));
play({Spawn.ar({Pan2.ar(o,1.0.rand2)},2,9/12)})
