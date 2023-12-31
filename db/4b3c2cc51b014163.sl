(* https://scsynth.org/t/time-varying-feedback-delay-network/5383/6 (dietcv) *)
var rotatableMatrix = { :angle |
	var s = angle.Sin;
	var c = angle.Cos;
	var givens2x2 = [
		c s.Neg;
		s c
	];
	var householder4x4 = [
		-0.5 0.5 0.5 0.5;
		0.5 -0.5 0.5 0.5;
		0.5 0.5 -0.5 0.5;
		0.5 0.5 0.5 -0.5
	];
	var kronecker = { :a :b |
		a.collect { :x |
			x.collect { :y |
				b * y
			}.reduce(plusPlusPlus:/2)
		}.reduce(plusPlus:/2)
	};
	kronecker(givens2x2, householder4x4)
};
var matrix = { :trig :rotateFreq :rotateAmount |
	var rotate = SinOsc(rotateFreq, 0).LinLin(-1, 1, 0, rotateAmount);
	var angle = Phasor(trig, rotate * SampleDur(), 0, 1, 0) * 2 * pi;
	rotatableMatrix(angle)
};
var ctl = (
	trig: 1,
	size: 0.15,
	sizeEnvAmount: 0.65,
	feedback: 0.9,
	coef: 0.3,
	rotateFreq: 0.1,
	rotateAmount: 55
);
var delMod = SinOsc(2, 0).LinLin(-1, 1, 1, 4);
var gainEnv = Perc(ctl::trig, 0.001, 1, -4);
var modEnv = Env([0 1 0], [0.125 0.5], [-8 -4], nil, nil, 0).asEnvGen(ctl::trig);
var inSig = Saw(XLine(100, 1000, 0.1)) * gainEnv;
var order = 8;
var size = ctl::size + modEnv.LinLin(0, 1, 0, ctl::sizeEnvAmount);
var delTimes = {
	randomInteger(1000, 4599).nextPrime
} ! order;
var sampleRate = 48000;
var delTimesSec = (delTimes * delMod) / sampleRate;
var sig = inSig + LocalIn(order, 0 ! order);
sig := DelayC(sig, 0.5, delTimesSec * size - ControlDur());
sig := sig * ctl::feedback;
sig := OnePole(sig, ctl::coef);
sig := sig * matrix(ctl::trig, ctl::rotateFreq, ctl::rotateAmount).transposed;
sig := sig.Sum;
(inSig + sig.Splay2 <! LocalOut(sig)) * 0.5
