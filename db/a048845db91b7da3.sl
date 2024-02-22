{- http://scsynth.org/t/share-your-delay-reverb-designs/2206 (mk) ; warning=feedback ; left=? -}
let ctl = (
	delay: 0.1,
	delayFb: 0.33,
	decayTime: 0.5,
	delayWidth: 0.1,
	modFreq: 0.1,
	modAmount: 0.25,
	fbLowCut: 0.5
).localControls;
let numChans = 2;
let input = AudioIn([1 .. numChans]);
let localIn = LocalIn(numChans, 0 # numChans);
let output = 1:numChans.collect { :cNum |
	let randScale = Rand(0.95, 1.0);
	let delayScale = cNum.odd.if {
		ctl::delayWidth.LinLin(0, 1, 0.5, 1.5)
	} {
		1
	};
	let delayVal = (delayScale * randScale * ctl::delay.LinLin(0, 1, 0.0001, 2)).Lag3(0.1);
	let phase = cNum.LinLin(1, numChans, -8.pi, 8.pi);
	let lfoFreq = (randScale * ctl::modFreq.LinExp(0, 1, 0.0001, 10)).Lag3(0.1);
	let minModAmount = ctl::modAmount.LinLin(0, 1, 1, 0.001).Lag(0.1) * delayVal;
	let delayValSig = LfTri(
		Rand(0.99, 1) * lfoFreq,
		phase
	).LinLin(-1, 1, minModAmount, delayVal);
	let fb0 = (ctl::delayFb * 1.1 * localIn[cNum]).Tanh;
	let fb1 = DelayL(fb0, 0.2, Rand(0.1, 0.2));
	let fb2 = Lpf(
		fb1,
		Rand(0.99, 1.0) * ctl::fbLowCut.LinExp(0, 1, 40, 12000)
	);
	let sig = AllpassC(
		input[cNum] + fb2,
		2,
		delayValSig,
		ctl::decayTime.LinLin(0, 1, 0.1, 3).Lag3(0.1)
	);
	LeakDc(sig, 0.995)
};
output <! LocalOut(output)
