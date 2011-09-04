var f = FSinOsc.kr(20+30.0.rand,100+300.0.rand,500 + 2000.0.linrand);
var o = SinOsc.ar(f,0,LFPulse.kr(3/(1 + 8.0.rand),0.2+0.3.rand,0.04));
OverlapTexture.ar({Pan2.ar(o,1.0.rand2)},8,8,4,2)
