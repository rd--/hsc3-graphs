{- https://scsynth.org/t/time-varying-feedback-delay-network/5383/6 (dietcv) -}
let rotatableMatrix = { :angle |
	let s = angle.Sin;
	let c = angle.Cos;
	let givens2x2 = [
		[c, s.Neg],
		[s, c]
	];
	let householder4x4 = [
		-0.5 0.5 0.5 0.5;
		0.5 -0.5 0.5 0.5;
		0.5 0.5 -0.5 0.5;
		0.5 0.5 0.5 -0.5
	];
	let kronecker = { :a :b |
		a.collect { :x |
			x.collect { :y |
				b * y
			}.reduce(+++)
		}.reduce(++)
	};
	kronecker(givens2x2, householder4x4)
};
let matrix = { :trig :rotateFreq :rotateAmount |
	let rotate = SinOsc(rotateFreq, 0).LinLin(-1, 1, 0, rotateAmount);
	let angle = Phasor(trig, rotate * SampleDur(), 0, 1, 0) * 2 * pi;
	rotatableMatrix(angle)
};
let ctl = (
	trig: 1,
	size: 0.15,
	sizeEnvAmount: 0.65,
	feedback: 0.9,
	coef: 0.3,
	rotateFreq: 0.1,
	rotateAmount: 55
).localControls;
let delMod = SinOsc(2, 0).LinLin(-1, 1, 1, 4);
let gainEnv = Perc(ctl::trig, 0.001, 1, -4);
let modEnv = Env([0 1 0], [0.125 0.5], [-8 -4], nil, nil, 0).asEnvGen(ctl::trig);
let inSig = Saw(XLine(100, 1000, 0.1)) * gainEnv;
let order = 8;
let size = ctl::size + modEnv.LinLin(0, 1, 0, ctl::sizeEnvAmount);
let delTimes = {
	randomInteger(1000, 4599).nextPrime
} ! order;
let sampleRate = 48000;
let delTimesSec = (delTimes * delMod) / sampleRate;
let sig = inSig + LocalIn(order, 0 ! order);
sig := DelayC(sig, 0.5, delTimesSec * size - ControlDur());
sig := sig * ctl::feedback;
sig := OnePole(sig, ctl::coef);
sig := sig * matrix(ctl::trig, ctl::rotateFreq, ctl::rotateAmount).transposed;
sig := sig.Sum;
(inSig + sig.Splay2 <! LocalOut(sig)) * 0.5
