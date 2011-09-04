play({CombN.ar(XFadeTexture.ar({
f = 500 + 400.rand;
r = 30 + 60.rand;
o = FSinOsc.ar(f*[1.0,1.2,1.5,1.8]);
a = max(0,LFNoise2.kr([r,r,r,r],0.1));
l = [1.0.rand2,1.0.rand2,1.0.rand2,1.0.rand2];
Mix.ar(Pan2.ar(o*a,l))},2,0.5,2),0.1,0.1,1)})
