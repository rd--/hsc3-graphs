// https://scsynth.org/t/share-your-delay-reverb-designs/2206 (mk) ; warning=feedback
arg delay=0.1, delayFb=0.33, decayTime=0.5, delayWidth=0.1, modFreq=0.1, modAmount=0.25, fbLowCut=0.5;
var input = AudioIn.ar([1, 2]);
var numChans = 2;
var localIn = LocalIn.ar(numChans, 0);
var output = (1 .. numChans).collect { | cNum |
	// random scalar to add variation
	var randScale = Rand(0.95, 1.0);
	// every other channel, scale delay
	var delayScale = cNum.odd.if {
		delayWidth.linlin(0.0, 1.0, 0.5, 1.5)
	} {
		1.0
	};
	// final, scaled delay value
	var delayVal = (delayScale * randScale * delay.linlin(0.0, 1.0, 0.0001, 2.0)).lag3(0.1);
	// delaytime modulator
	var phase = cNum.linlin(1, numChans, -8 * pi, 8 * pi);
	var lfoFreq = (randScale * modFreq.linexp(0.0, 1.0, 0.0001, 10.0)).lag3(0.1);
	var minModAmount = modAmount.linlin(0.0, 1.0, 1.0, 0.001).lag(0.1) * delayVal;
	var delayValSig = LFTri.kr(
		Rand(0.99, 1.0) * lfoFreq,
		phase
	).linlin(-1.0, 1.0, minModAmount, delayVal);
	// tanh for "limiting"
	var fb0 = (delayFb * 1.1 * localIn[cNum - 1]).tanh;
	// avoid phase problems that sound "flat"
	var fb1 = DelayL.ar(fb0, 0.2, Rand(0.1, 0.2));
	var fb2 = LPF.ar(
		fb1,
		Rand(0.99, 1.0) * fbLowCut.linexp(0.0, 1.0, 40.0, 12000.0)
	);
	// final delay
	var sig = AllpassC.ar(
		input[cNum - 1] + fb2,
		2,
		delayValSig,
		decayTime.linlin(0.0, 1.0, 0.1, 3.0).lag3(0.1)
	);
	LeakDC.ar(sig, 0.995)
};
output <! LocalOut.ar(output)
