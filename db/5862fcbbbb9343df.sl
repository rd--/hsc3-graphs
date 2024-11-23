/* <https://scsynth.org/t/1074> ao ; <https://raw.githubusercontent.com/Hyppasus/supercollider-examples/master/Benjolisc.scd> */
let freq1 = 'freq1'.kr(40);
let freq2 = 'freq2'.kr(4);
let scale = 'scale'.kr(1);
let rungler1 = 'rungler1'.kr(0.16);
let rungler2 = 'rungler2'.kr(0.0);
let runglerFilt = 'runglerFilt'.kr(9);
let loop = 'loop'.kr(0);
let filtFreq = 'filtFreq'.kr(40);
let q = 'q'.kr(0.82);
let gain = 'gain'.kr(1);
let filterType = 'filterType'.kr(0);
let outSignal = 'outSignal'.kr(6);
let amp = 'amp'.kr(1);
let bufR = LocalIn(2, [0 0]);
let rungler0 = bufR[1];
let buf = bufR[2];
let sr = SampleDur();
let tri1 = LfTri((rungler0 * rungler1) + freq1, 0);
let tri2 = LfTri((rungler0 * rungler2) + freq2, 0);
let pwm = (tri1 + tri2) > 0;
let osc1 = PulseDpw((rungler0 * rungler1) + freq1, 0.5);
let osc2 = PulseDpw((rungler0 * rungler2) + freq2, 0.5);
let osc3 = ((buf * loop) + (osc1 * (loop * -1 + 1)));
let sh0 = osc3 > 0.5;
let sh8 = 1;
let sh0a = (sh8 > sh0) = (sh8 < sh0);
let sh0b = (sh0a * -1) + 1;
let sh1 = DelayN(Latch(sh0b, osc2), 0.01, sr);
let sh2 = DelayN(Latch(sh1, osc2), 0.01, sr * 2);
let sh3 = DelayN(Latch(sh2, osc2), 0.01, sr * 3);
let sh4 = DelayN(Latch(sh3, osc2), 0.01, sr * 4);
let sh5 = DelayN(Latch(sh4, osc2), 0.01, sr * 5);
let sh6 = DelayN(Latch(sh5, osc2), 0.01, sr * 6);
let sh7 = DelayN(Latch(sh6, osc2), 0.01, sr * 7);
let sh8b = DelayN(Latch(sh7, osc2), 0.01, sr * 8);
let rungler = [
	(sh1 / (2 ^ 8)),
	(sh2 / (2 ^ 7)),
	(sh3 / (2 ^ 6)),
	(sh4 / (2 ^ 5)),
	(sh5 / (2 ^ 4)),
	(sh6 / (2 ^ 3)),
	(sh7 / (2 ^ 2)),
	(sh8b / (2 ^ 1))
].sum;
let buf1 = rungler;
let runglerF = (rungler * scale.LinLin(0, 1, 0, 127)).MidiCps;
let filt = Select(
	filterType,
	[
		Rlpf(pwm, (runglerF * runglerFilt) + filtFreq, q * -1 + 1) * gain,
		Rhpf(pwm, (runglerF * runglerFilt) + filtFreq, q * -1 + 1) * gain,
		Svf(pwm, (runglerF * runglerFilt) + filtFreq, q, 1, 0, 0, 0, 0) * gain,
		Dfm1(pwm, (runglerF * runglerFilt) + filtFreq, q, gain, 1, 0.0003)
	]
);
let output = Select(
	outSignal,
	[tri1, osc3, tri2, osc2, pwm, sh0b, filt]
);
LeakDc(output * amp # 2, 0.995) <! LocalOut([runglerF, buf1]) * 0.1
