// contamination zone (jmcc) #9
{
	var f = 800.expRandRange(8000);
	var pan = LFNoise1.kr(1.0.rand0);
	var amp = LFPulse.kr(15.0.linRand0, 0, 0.2 + 0.2.rand0);
	var exc = PinkNoise.ar * (LFNoise1.kr(3.0.rand0) * 0.0008 + 0.0022);
	var sig = RingzBank.ar(exc, { 50.0.rrand(2000) }.dup(4), nil, { 0.2.rrand(4) }.dup(4)).abs * #[-1, 1].choose;
	var flt = RLPF.ar(sig, SinOsc.kr(1.0.linRand0, 0) * 0.7 * f + f, 0.1);
	var z = Pan2.ar(flt, pan, amp);
	6.do({ z = AllpassN.ar(z, 0.1, { 0.05.rand0 }.dup(2), 4) });
	z
}.overlap(8, 3, 4)

// contamination zone (jmcc) #9 ; post process
Texture.overlapRoutine({
	var f = 800.expRandRange(8000);
	var pan = LFNoise1.kr(1.0.rand0);
	var amp = LFPulse.kr(15.0.linRand0, 0, 0.2 + 0.2.rand0);
	var exc = PinkNoise.ar * (LFNoise1.kr(3.0.rand0) * 0.0008 + 0.0022);
	var sig = RingzBank.ar(exc, { 50.0.rrand(2000) }.dup(4), nil, { 0.2.rrand(4) }.dup(4)).abs * #[-1, 1].choose;
	var flt = RLPF.ar(sig, SinOsc.kr(1.0.linRand0, 0, 0.7 * f, f), 0.1);
	Pan2.ar(flt, pan, amp)
}, 8, 3, 4, postProcess: {
	arg z;
	6.do({ z = AllpassN.ar(z, 0.1, { 0.05.rand0 }.dup(2), 4) });
	z
})
