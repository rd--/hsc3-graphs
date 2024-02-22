// <https://scsynth.org/t/1074> ao ; <https://raw.githubusercontent.com/Hyppasus/supercollider-examples/master/Benjolisc.scd>
arg freq1 = 40, freq2 = 4, scale = 1, rungler1 = 0.16, rungler2 = 0.0, runglerFilt = 9, loop = 0, filtFreq = 40, q = 0.82, gain = 1, filterType = 0, outSignal = 6, amp = 1;
var bufR = LocalIn.ar(2, 0);
var rungler0 = bufR[0];
var buf = bufR[1];
var sr = SampleDur.ir;
var tri1 = LFTri.ar((rungler0 * rungler1) + freq1, 0);
var tri2 = LFTri.ar((rungler0 * rungler2) + freq2, 0);
var pwm = (tri1 + tri2) > 0;
var osc1 = PulseDPW.ar((rungler0 * rungler1) + freq1, 0.5);
var osc2 = PulseDPW.ar((rungler0 * rungler2) + freq2, 0.5);
var osc3 = ((buf * loop) + (osc1 * (loop * -1 + 1)));
var sh0 = osc3 > 0.5;
var sh8 = 1;
var sh0a = BinaryOpUGen('==', (sh8 > sh0), (sh8 < sh0));
var sh0b = (sh0a * -1) + 1;
var sh1 = DelayN.ar(Latch.ar(sh0b, osc2), 0.01, sr);
var sh2 = DelayN.ar(Latch.ar(sh1, osc2), 0.01, sr * 2);
var sh3 = DelayN.ar(Latch.ar(sh2, osc2), 0.01, sr * 3);
var sh4 = DelayN.ar(Latch.ar(sh3, osc2), 0.01, sr * 4);
var sh5 = DelayN.ar(Latch.ar(sh4, osc2), 0.01, sr * 5);
var sh6 = DelayN.ar(Latch.ar(sh5, osc2), 0.01, sr * 6);
var sh7 = DelayN.ar(Latch.ar(sh6, osc2), 0.01, sr * 7);
var sh8b = DelayN.ar(Latch.ar(sh7, osc2), 0.01, sr * 8);
var rungler = [
	(sh1 / (2 ** 8)),
	(sh2 / (2 ** 7)),
	(sh3 / (2 ** 6)),
	(sh4 / (2 ** 5)),
	(sh5 / (2 ** 4)),
	(sh6 / (2 ** 3)),
	(sh7 / (2 ** 2)),
	(sh8b / (2 ** 1))
].sum;
var buf1 = rungler;
var runglerF = (rungler * scale.linlin(0, 1, 0, 127)).midicps;
var filt = Select.ar(
	filterType,
	[
		RLPF.ar(pwm, (runglerF * runglerFilt) + filtFreq, q * -1 + 1) * gain,
		RHPF.ar(pwm, (runglerF * runglerFilt) + filtFreq, q * -1 + 1) * gain,
		SVF.ar(pwm, (runglerF * runglerFilt) + filtFreq, q, 1, 0, 0, 0, 0) * gain,
		DFM1.ar(pwm, (runglerF * runglerFilt) + filtFreq, q, gain, 1, 0.0003)
	]
);
var output = Select.ar(
	outSignal,
	[tri1, osc3, tri2, osc2, pwm, sh0b, filt]
);
LocalOut.ar([runglerF, buf1]);
LeakDC.ar(output * amp ! 2, 0.995)
