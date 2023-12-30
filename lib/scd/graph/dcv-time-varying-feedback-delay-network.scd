// https://scsynth.org/t/time-varying-feedback-delay-network/5383/6 (dietcv)
var rotatableMatrix = { | angle |
	var s = angle.sin;
	var c = angle.cos;
	var givens2x2 = [
		[ c, s.neg ],
		[ s,  c ]
	];
	var householder4x4 = [
		[ -0.5,  0.5,  0.5,  0.5 ],
		[  0.5, -0.5,  0.5,  0.5 ],
		[  0.5,  0.5, -0.5,  0.5 ],
		[  0.5,  0.5,  0.5, -0.5 ],
	];
	var kronecker = { | a b |
		a.collect { | x |
			x.collect { | y |
				b * y
			}.reduce('+++')
		}.reduce('++')
	};
	kronecker.value(givens2x2, householder4x4);
};
var matrix = { | trig rotateFreq rotateAmount |
	var rotate = SinOsc.ar(rotateFreq, 0).linlin(-1, 1, 0, rotateAmount);
	var angle = Phasor.ar(trig, rotate * SampleDur.ir(), 0, 1, 0) * 2 * pi;
	rotatableMatrix.value(angle);
};
var trig = 'trig'.kr(1);
var delMod = SinOsc.ar(2, 0).linlin(-1, 1, 1, 4);
var gainEnv = EnvGen.ar(Env.perc(0.001, 1, 1, -4), trig, 1, 0, 1, Done.none);
var modEnv = EnvGen.ar(Env([0,1,0], [0.125, 0.5], [-8.0, -4.0], nil, nil, 0), trig);
var inSig = Saw.ar(XLine.kr(100, 1000, 0.1)) * gainEnv;
var order = 8;
var size = 'size'.kr(0.15) + modEnv.linlin(0, 1, 0, 'sizeEnvAmount'.kr(0.65));
var delTimes = { rrand(1000, 4599).nextPrime } ! order;
var delTimesSec = (delTimes * delMod) / 44100;
var sig = Mix(inSig);
sig = sig + LocalIn.ar(order, 0);
sig = DelayC.ar(sig, 0.5, delTimesSec * size - ControlDur.ir);
sig = sig * 'feedback'.kr(0.9);
sig = OnePole.ar(sig, 'coef'.kr(0.3));
sig = sig * matrix.value(trig, 'rotateFreq'.kr(0.1), 'rotateAmount'.kr(55)).flop;
sig = sig.sum;
(inSig + Splay.ar(sig) <! LocalOut.ar(sig)) * 0.5
