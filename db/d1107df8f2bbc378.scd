// https://github.com/schollz/18000/blob/main/drone/toshiya.scd
var hz = 440;
var amp = 1.0;
var note = hz.cpsmidi;
var gen = {
    var sig = SinOsc.ar((note + TChoose.kr(Impulse.kr(Rand.ir(1 / 30, 1 / 5), 0), [0, 9, 4, 14, 5, 2, 17])).midicps, 0);
    sig = LPF.ar(sig, LinExp.kr(SinOsc.kr(Rand.ir(1 / 30, 1 / 10), Rand.ir(0, 2 * pi)), -1, 1, 20, 12000), 2);
    sig = DelayC.ar(sig, Rand.ir(0.01, 0.03),  LFNoise1.kr(Rand.ir(5, 10), 0.01, 0.02) / NRand.ir(10, 20, 3));
    Pan2.ar(sig, Lag.kr(LFNoise0.kr(1 / 3), 3), 1) / 12 * amp
};
var osc = gen.dup(12).sum + Pan2.ar(SinOsc.ar((note - 12).midicps, LinLin.kr(LFTri.kr(0.5, 0), -1, 1, 0.2, 0.8)) / 12 * amp, SinOsc.kr(0.1,  0) * 0.2,  1);
var snd = MoogLadder.ar(osc.tanh, LinExp.kr(Lag.kr(LFNoise0.kr(1 / 6), 6), -1, 1, hz * 2, hz * 10), 0);
var z =  DelayN.ar(snd,  0.048, 0.048);
var y  =  { CombL.ar(z,  0.1,  LFNoise1.kr(Rand.ir(0, 0.1)) * 0.04 + 0.05,  15) }.dup(7).sum;
4.timesRepeat({ y  =  AllpassN.ar(y,  0.050,  [Rand.ir(0, 0.050),  Rand.ir(0, 0.050)],  1) });
snd = snd + (LinLin.kr(Lag.kr(LFNoise0.kr(1 / 10), 10), -1, 1, 0.01, 0.06) * y);
snd = snd  +  [
	Amplitude.kr(snd, 0.01, 0.01),
	LinLin.kr(Lag.kr(LFNoise0.kr(1 / 1), 1), -1, 1, 0, 1),
	RingzBank.ar({ PinkNoise.ar() * 0.007 }.dup(2), [hz,  hz * 2 + 23,  hz * 4 + 53,  hz * 8 + 23],  nil,  [1,  1,  1,  1])
].product;
snd = LPF.ar(snd, 10000);
snd = HPF.ar(snd.tanh, 20);
snd * -10.dbamp
