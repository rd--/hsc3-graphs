// f0 <https://twitter.com/redFrik/status/1343283697840226307>
var b = 11.iota + 2 / 12;
var f = { arg i; Scale.yu(Tuning.just).degreeToFreq(i, 121.21, 2 / 12) };
var z = WhiteNoise.ar(LFTri.ar(b, 0) + 1 / 2) + BrownNoise.ar;
var t = LFTri.ar(121 ** LFTri.ar(2 / 121 * b, 0));
var d = (1 / 212 > LFTri.ar(1 / 212.1, 0)).lag2(2 / b) / 12 * 1.2 + 1.2 / (f.dup(b.size));
var p = Pluck.ar(z, t, 2 / 121, d, 1 / 2 * 12 / 1.2, LFTri.ar(b / 12, 0) + 1 / 2);
Splay.ar(HPF.ar(p, 12), 1, 1 / 2.1 / 2, 0, true)

//---- f0 <https://twitter.com/redFrik/status/1343283697840226307>
{ar(Splay,ar(HPF,ar(Pluck,ar(WhiteNoise,ar(a=LFTri,b=(2..12)/12)+1/2)+ar(BrownNoise),ar(a,121**ar(a,2/121*b)),2/121,lag2(1/212>ar(a,1/212.1),2/b)/12*1.2+1.2/((Scale.yu(Tuning.just).degreeToFreq(_,121.21,2/12))!b.size),1/2*12/1.2,ar(a,b/12)+1/2),12,1/2.1/2))}

//---- calculations
{arg i; Scale.yu(Tuning.just).degreeToFreq(i,121.21,2/12)}!11
((2..12) / 12) == (11.iota + 2 / 12)