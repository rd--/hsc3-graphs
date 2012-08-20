var o = FSinOsc.ar(400+2000.0.rand,LFPulse.kr(1+10.0.rand,0.7.rand,0.04));
{OverlapTexture.ar({Pan2.ar(o,1.0.rand2)},4,4,8,2)}.play
