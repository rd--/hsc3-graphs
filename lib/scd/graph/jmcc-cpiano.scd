// cpiano (jmcc) ; graph rewrite ; http://www.iamas.ac.jp/~aka/dspss2004/materials/
var nc = 2;
OverlapTexture({
    arg tr;
    var dgr = DegreeToKey.kr([0, 2, 4, 5, 7, 9, 11].asLocalBuf, TRand.kr(0, 12, tr), 12);
    var freq = (60 + dgr).midiCps;
    var pan = TRand.kr(-0.25, 0.25, tr);
    var amp = TRand.kr(0.1, 0.2, tr);
	var hammerEnv = Decay2.kr(tr, 0.008, 0.04) * amp;
	var src = [0.997, 1.0, 1.002].collect { | detune |
		var delayTime = (freq * detune).reciprocal;
		var hammer = LFNoise2.ar(3000) * hammerEnv;
		CombL.ar(hammer, delayTime, delayTime, 6)
	}.sum;
	PanAz.ar(nc, src, pan, 1, 2, 0.5)
}, 2, 0, 10)
