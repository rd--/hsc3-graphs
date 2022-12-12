// AnalogFoldOsc
LPF.ar(AnalogFoldOsc.ar(60 + #[0, 1], SinOsc.ar(LFSaw.ar(0.1, 0) * 4, 0).range(0, 1)), 1330)

// Balance2
Balance2.ar(LFSaw.ar(44, 0), Pulse.ar(33, 0.5), SinOsc.ar(0.5, 0), 0.1)

// Balance2
var o = SinOsc.ar(#[440, 550], 0); Balance2.ar(o.first, o.second, LFNoise1.ar(4), 0.3)

// Balance2
var o = SinOsc.ar(440, 0); Balance2.ar(o, o, SinOsc.ar(0.2, 0), 0.2)

// Balance2
var o = SinOsc.ar(440, 0); Balance2.ar(o, o, MouseX.kr(-1, 1, 0, 0.2), 0.2)

// Blip
var ln = Ln.kr(1, 20, 60);
var tr = Impulse.kr(ln, 0);
Blip.ar(TRand.kr(100, 1000, tr), TRand.kr(1, 10, tr)) * Linen.kr(tr, 0, 0.5, 1 / ln, 0)

// Blip
Blip.ar(MouseX.kr([3, 12], 1, 0, 0.2), MouseY.kr([100, 1000], 1, 0, 0.2)) * 0.1

// BlockSize (default=64)
SinOsc.ar([BlockSize.ir(), ControlDur.ir() * SampleRate.ir()] * MouseX.kr(2, 8, 0, 0.2), 0) * 0.05

// BLowPass4 ; rq should compensate for 2 biquad sections
BLowPass4.ar(
        WhiteNoise.ar(),
        MouseX.kr(10, 20000, 1, 0.2),
        MouseY.(0.1, 1, 0, 0.2)
) * 0.25

// BLowPass4 ; compare to nested BLowPass
var n = WhiteNoise.ar();
var x = MouseX.kr(10, 20000, 1, 0.2);
var y = MouseY.kr(0.1, 1, 0, 0.2);
[BLowPass4.ar(n, x, y), BLowPass.ar(BLowPass.ar(n, x, y.sqrt), x, y.sqrt)] * 0.25

// Clip ; https://scsynth.org/t/5208/2 (sp)
var freq = 10;
var osc = SinOsc.ar(freq, 0);
var interp = (MouseX.kr(1, 0, 0, 0.2) ** 8) * 50 + 1;
var sig = Clip.ar(osc * interp, -1, 1) * 0.5 + 0.5;
SinOsc.ar(200 + (sig * 1000), 0) * 0.1

// CombN
var m = LFNoise1.ar(3) * 24 + (LFSaw.ar(#[5, 5.123], 0) * 3 + 80);
CombN.ar(SinOsc.ar(m.midiCps, 0) * 0.4, 1, 0.3, 2)

// Convolution
var tr = Dust.ar(100);
var vc = {
    var freq = TRand.ar(2700, 2750, tr);
    var amp = TRand.ar(0.1, 0.2, tr);
    HPF.ar(amp * Convolution.ar(Saw.ar(freq), tr, 512), 10000);
};
vc.dup(5).splay

// CrossoverDistortion
CrossoverDistortion.ar(SinOsc.ar(#[400, 404], 0) * 0.2, MouseX.kr(0, 1, 0, 0.2), MouseY.kr(0, 1, 0, 0.2))

// CrossoverDistortion
CrossoverDistortion.ar(SoundIn.ar(), MouseX.kr(0, 1, 0, 0.2), MouseY.kr.kr(0, 1, 0, 0.2))

// DFM1 ; mouse control
DFM1.ar(PinkNoise.ar() * 0.2, MouseX.kr(80, 5000, 1, 0.2), MouseY.kr(0.1, 1.2, 0, 0.2), 2, 0, 0.0003)

// DFM1
var in = Pulse.ar([100, 100.1], 0.5).sum * 0.4;
var freq = SinOsc.kr(SinOsc.kr(0.3, 0).range(0.2, 5), 0).range(80, 2000);
DFM1.ar(in, freq, 1.1, 2, 0, 0.0003) * 0.2

// Dseq ; shared dseq, different patterns
var a = Dseq.dr(list: [1,3,2,7,8], repeats: inf);
var t = Impulse.kr(freq: 5, phase: 0);
var f = Demand.kr(trig: t, reset: 0, demandUGens: [a,a]) * 30 + 340;
SinOsc.ar(freq: f, phase:  0) * 0.1

// Dseq ; distinct dseq, equal patterns
var a = Dseq.dr(list: [1,3,2,7,8], repeats: inf);
var b = Dseq.dr(list: [1,3,2,7,8], repeats: inf);
var t = Impulse.kr(freq: 5, phase: 0);
var f = Demand.kr(trig: t, reset: 0, demandUGens: [a,b]) * 30 + 340;
SinOsc.ar(freq: f, phase:  0) * 0.1

// DynKlank
var s = Ref.new([[800, 1071, 1153, 1723], nil, [1, 1, 1, 1]]);
DynKlank.ar(s, Impulse.ar(2, 0) * 0.1, 1, 0, 1)

// DynKlank
var s = Ref.new([[800, 1071, 1353, 1723], nil, [1, 1, 1, 1]]);
DynKlank.ar(s, Dust.ar(8) * 0.1, 1, 0, 1)

// DynKlank
var s = Ref.new([[800, 1071, 1353, 1723], nil, [1, 1, 1, 1]]);
DynKlank.ar(s, PinkNoise.ar() * 0.007, 1, 0, 1)

// DynKlank
var s = Ref.new([[200, 671, 1153, 1723], nil, [1, 1, 1, 1]]);
DynKlank.ar(s, PinkNoise.ar() * [0.007, 0.007], 1, 0, 1)

// DynKlank
var tr = Dust.kr(25);
var spec = Ref.new([(1..5) * 2700, TRand.kr(0.025, 0.04, tr.dup(5)), 0.1.dup(5)]);
var k = DynKlank.ar(spec, Trig.ar(tr, SampleDur.ir), 1, 0, 1);
var n = k + (BrownNoise.ar * 0.075 * Trig.kr(tr, TRand.kr(0.01, 0.03, tr)));
var f = LPF.ar(HPF.ar(n, TRand.kr(6000, 7500, tr).lag(0.01)), TRand.kr(4000, 5500, tr).lag(0.01));
Pan2.ar(f, TRand.kr(-0.5, 0.5, tr).lag(0.01), 1)

// EnvGen ; as triangle wave oscillator
var f = MouseX.kr(110, #[220, 330], 0, 0.2);
var e = Env.new([0, 0, 1, 0, -1],  [0.25, 0.25, 0.25, 0.25], 'lin', nil, 0, 0);
EnvGen.ar(e, Impulse.ar(f, 0), 0.1, 0, 1 / f, 0)

// Env.adsr ; mouse as gate input
SinOsc.ar(440, 0) * EnvGen.kr(Env.adsr(0.75, 1.75, 0.35, 3.25, 1, -4, 0), MouseButton.kr(0, 1, 0.2), 0.1, 0, 1, 0)

// Env.adsr ; kr
var tr = Impulse.kr(#[1, 0.75], 0);
var gt = Trig.kr(tr, TRand.kr(0.1, 0.2, tr));
var o = Blip.ar(TRand.kr(48, #[60, 72], tr).midicps, TRand.kr(1, 7, tr));
var a = EnvGen.kr(Env.adsr(TRand.kr(0.01, 0.2, tr), TRand.kr(0.3, 0.6, tr), TRand.kr(0.4, 0.6, tr), TRand.kr(0.5, 2, tr), -4), gt, 1, 0, 1, 0);
o * a * 0.1

// Env.adsr ; ar
var tr = Impulse.ar(1, 0);
var gt = Trig.ar(tr, TRand.ar(0.1, 0.2, tr));
var o = Blip.ar(TRand.ar(48, #[60, 72], tr).midicps, TRand.ar(1, 7, tr));
var a = EnvGen.ar(Env.adsr(TRand.ar(0.01, 0.2, tr), TRand.ar(0.3, 0.6, tr), TRand.ar(0.4, 0.6, tr), TRand.ar(0.5, 2, tr), -4), gt, 1, 0, 1, 0);
o * a * 0.1

// Env.circle
var e = Env.new([6000, 700, 100], [1, 1], ['exp', 'lin'], nil, nil, 0).circle(1,\lin);
SinOsc.ar(e.kr(0, 1, 1, 1, 0), 0) * 0.1

// Env.perc ; kr
var tr = Impulse.kr(1, 0);
var o = Blip.ar(TRand.kr(48, #[60, 72], tr).midicps, TRand.kr(1, 7, tr));
var a = EnvGen.kr(Env.perc(TRand.kr(0.01, 0.2, tr), TRand.kr(0.2, 2, tr), 1, -4), tr, 1, 0, 1, 0);
o * a * 0.1

// Env.perc ; ar
var tr = Impulse.ar(1, 0);
var o = Blip.ar(TRand.ar(48, #[60, 72], tr).midicps, TRand.ar(1, 7, tr));
var a = EnvGen.ar(Env.perc(TRand.ar(0.01, 0.2, tr), TRand.ar(0.2, 2, tr), 1, -4), tr, 1, 0, 1, 0);
o * a * 0.1

// FM7
var freq = LFNoise0.kr(3).linExpFrom(200, to: 310);
var ctls = [
	[freq, 0, 1],
	[freq, 0, 1],
	[LFNoise2.kr(0.5).linExpFrom(3, to: 80), 0, 1],
	[LFNoise2.kr(0.5).linExpFrom(3, to: 800), 0, 1],
	[LFNoise2.kr(0.5).linExpFrom(3, to: 800), 0, 1],
	[LFNoise2.kr(0.5).linExpFrom(0.3, to: 10), 0, 1]
];
var x = MouseX.kr(0, 3, 0, 0.2);
var mods = { { LFNoise1.kr(0.5).max(0) }.dup(6) * x }.dup(6);
FM7.ar(ctls, mods).keep(2) * -12.dbAmp

// Formlet
var i = Impulse.ar(1, 0.5);
Formlet.ar(i, TRand.ar(30, 50, i), 0.01, 2)

// Formlet
var i = Impulse.ar(20, 0.5);
Formlet.ar(i, Rand.ir(300,1000), 0.01, Rand.ir(0.05, 0.2))

// Formlet
var i = Impulse.ar(LFNoise2.kr([0.15, 0.6]) * 15 + 15, 0.5);
Formlet.ar(i, TRand.ar(30, [150, 600], i), TRand.ar(0.01, [0.15, 0.6], i), TRand.ar(0.05, [0.15, 0.6], i)) * 0.25

// Formlet
var amp = LFPulse.kr(0.5, 0, 0.5);
var my = MouseY.kr(400, 3200, 0, 0.2);
Mix.ar({
	var x = Formlet.ar({ Dust.ar(12) }.dup(2) * 0.05 * amp, my * 0.5.exprand(2), 0.005, 0.1);
	AllpassN.ar(x, 0.05, 0.05.rand, 8);
}.dup(8))

// FreqShift
var a = Blip.ar(60, 4) * LFGauss.ar(4, 1/8, 0, 1, 0);
var b = a / 4 + LocalIn.ar(2, 0);
var c = FreqShift.ar(b, LFNoise0.kr(1/4) * 90, 0);
c.mrg(LocalOut.ar(DelayC.ar(c, 1, 0.1) * 0.9))

// GrainSin
var overlap = MouseY.kr(0, 2, 0, 0.2);
var f = MouseX.kr(1, 220, 0, 0.2);
var t = Impulse.ar(f, 0);
var a = GrainSin.ar(2, t, overlap / f, 440, 0, -1, 512);
LeakDC.ar(a, 0.995) * 0.1

// GrainSin ; keywords
var overlap = MouseY.kr(minval: 0, maxval: 2, warp: 0, lag: 0.2);
var f = MouseX.kr(minval: 1, maxval: 220, warp: 0, lag: 0.2);
var t = Impulse.ar(freq: f, phase: 0);
var a = GrainSin.ar(numChannels: 2, trigger: t, dur: overlap/f, freq: 440, pan: 0, envbufnum: -1, maxGrains: 512);
LeakDC.ar(in: a, coef: 0.995) * 0.1

// GravityGrid
Pan2.ar(0.05 * GravityGrid.ar(Impulse.kr(2, 0), MouseX.kr(0.1, 10, 1, 0.2), LFNoise0.kr(2) * 0.8, LFNoise0.kr(2) * 0.8, -1), 0, 0.25)

// GravityGrid
Pan2.ar(0.5 * GravityGrid.ar(Impulse.kr(1, 0), SinOsc.kr(0.5, 0) * 0.8 + 1,LFSaw.kr(50, 0), LFNoise0.kr(10) * 0.8, -1), 0, 0.05)

// GravityGrid ; rhythmic violence
GravityGrid.ar(Impulse.kr(LFNoise0.kr([0.25, 0.231]) * 90 + 100, 0), [100.2, 10.5], LFNoise0.kr(10) * 0.8, LFNoise0.kr(10) * 0.8, -1) * 0.025

// GravityGrid ; noisy
Pan2.ar(Resonz.ar(GravityGrid.ar(Impulse.kr(50, 0), 0.01, LFNoise0.kr(1) * 4, LFNoise0.kr(1) * 4, -1), 1000, 0.1), 0, 0.25)

// GravityGrid ; 48k spectrum looping
Pan2.ar(Resonz.ar(GravityGrid.ar(Impulse.kr(5, 0), 0.01, LFNoise0.kr(1) * 4, LFNoise0.kr(1) * 4, -1), 1000, 0.1), 0, 0.25)

// GrayNoise
var amp = LFPulse.kr(4, 0, 0.1) * 0.002;
var exc = LPZ1.ar({ GrayNoise.ar }.dup(2) * amp);
RingzBank.ar(exc, { Rand.ir(80, 400) }.dup(4), nil, nil)

// Integrator ; https://nathan.ho.name/posts/feedback-integrator-networks/ ; blockSize=1
var n = 8;
var snd = Impulse.ar(0, 0);
snd = snd + LocalIn.ar(n, 0);
snd = Integrator.ar(snd, 0.99);
snd = snd * ({ { Rand.ir(-1, 1) * 1000 }.dup(n) }.dup(n));
snd = snd.sum;
snd = LeakDC.ar(snd, 0.995);
snd = snd.clip2;
LocalOut.ar(snd);
Splay.ar(snd, 1, 1, 0, true) * 0.1;

// Klang
Klang.ar(Ref.new([[800, 1000, 1200], [0.3, 0.3, 0.3], [pi, pi, pi]], 1, 0)) * 0.4

// Klang
Klang.ar(Ref.new([[800, 1000, 1200], nil, nil], 1, 0)) * 0.25

// Klang
Klang.ar(Ref.new([Array.rand(12, 600.0, 1000.0), nil, nil], 1, 0)) * 0.05

// LFCub ; phase value = (0, 2), offset to lowest and midpoint ascending
LFCub.ar(110, 2 * [0.75, 0]) * 0.1

// LFNoise0
SinOsc.ar(LFNoise0.kr(12) * 600 + 1000, 0) * 0.1

// LFNoise0
CombN.ar(
	LPF.ar(LFNoise0.ar(MouseX.kr(300, 2200, 0, 0.2) * [1, 1.1], LFPulse.kr(1, 0, 0.3) * 0.1), 800).abs,
	0.2,
	[0.2, 0.17],
	5
)

// LFPar ; phase value = (0, 4), offset to lowest and midpoint ascending
LFPar.ar(110, 4 * [0.5, 0.75]) * 0.1

// LFPulse ; phase value = (0, 1), offset to lowest point
LFPulse.ar(110, 1 * 0.5, 0.5) * 0.1

// LFPulse <https://scsynth.org/t/4877>
var cluster = 10.collect({ 20.exprand(20 * 15 / 16) });
var freq = 8.collect({ arg n; (30 / 16) ** n * cluster }).flat;
Splay.ar(SinOsc.ar(freq * LFPulse.ar(0.5).range(1,0.5), 0)) * 0.02

// LFSaw ; phase value = (0, 2), offset to lowest and midpoint ascending
LFSaw.ar(110, 2 * [0.5, 0]) * 0.1

// LFSaw
var f = {
    arg i;
    var o = LFSaw.ar(11.9 * (8.0625 / 4 ** i));
    BLowPass4.ar(o * 0.01, 25 * (6.125 / 4 ** i) * 11)
};
Splay.ar(8.collect(f)) * 0.4

// LFTri ; phase value = (0, 4), offset to lowest and midpoint ascending
LFTri.ar(110, 4 * [0.75, 0]) * 0.1

// Line - NOTE: doneAction input is placed AFTER mul and add inputs
SinOsc.ar(Line.kr(200, 17000, 10, doneAction: 1), 0) * 0.1

// Linen
var r = MouseX.kr(1/3, 10, 0, 0.2);
SinOsc.ar(440, 0) * Linen.kr(Impulse.kr(r, 0), 0, 1, 1 / r, 0)

// LinExp
var mod = SinOsc.kr(Line.kr(1, 10, 10));
[SinOsc.ar(mod * 400 + 500), SinOsc.ar(LinExp.kr(mod, -1, 1, 100, 900))] * 0.1

// LinSelectX
var f = MouseY.kr(220, 440, 1, 0.2);
var s = [LFTri.ar(f, 0), SinOsc.ar(f, 0), LFPulse.ar(f, 0, 0.5) * 2 - 1];
LinSelectX.ar(MouseX.kr(0, 1, 0, 0.2) * (s.size - 1), s) * 0.1

// LinXFade2
LinXFade2.ar(SinOsc.ar(800, 0) * 0.1, PinkNoise.ar() * 0.1, SinOsc.ar(1, 0))

// LocalBuf ; https://sccode.org/1-5fx
var t = { 0.08.rand2 }.dup(1024).asLocalBuf;
var e = SinOsc.kr(0.5 * LFNoise1.kr(10) * 0.2 + 1, 0) * 0.1 + 1.05;
Pan2(RHPF.ar(LPF.ar(Osc.ar(t, 0.05, 0), 400), 500, 0.76), 0, e)

// LPF ; https://scsynth.org/t/5208/7 ; at very low frequencies LPF acts strangely
var impulseFreq = 3;
var lfo = LFPulse.ar(impulseFreq, 0, 0.5);
var freq = LinExp.kr(MouseX.kr(0, 1, 0, 0.2), 0, 1, impulseFreq, 20000);
SinOsc.ar(200 + (LPF.ar(lfo, freq) * 200), 0) * 0.1

// LPF ; event control
Mix.ar(Voicer.ar(16, {
    arg e;
    var f0 = e.p.unitCps;
    Pan2.ar(LPF.ar(Blip.ar(f0, 1 + e.y * 5), f0 * 0.25), e.o * 2 - 1, LagUD.kr(e.w, 0.05, 1) * e.z * 4)
}))

// max
SinOsc.ar(XLine.kr([100, 200], [400, 100], 2).inject(0, { arg i, j; i.max(j) }), 0) * 0.1

// max
var freq = { LFNoise2.kr(1) }.dup(3)  * 100 + 200;
var freqMax = freq.inject(0, { arg i, j; i.max(j) });
(LFTri.ar(freqMax, 0) * 0.05) + (SinOsc.ar(freq, 0).splay2 * 0.1)

// MulAdd ; optimised away
MulAdd(SinOsc.ar(440, 0) * 0.1, 1, 0)

// MulAdd ; optimised away ; single Mul operator
MulAdd(SinOsc.ar(440, 0), 0.1, 0)

// Mce
SinOsc.ar(#[440, 441], 0) * 0.1

// Mce
SinOsc.ar(#[[440, 441]], 0) * 0.1

// MiBraids ; 6=saw_sub ; basic example
MiBraids.ar(pitch: 60, timbre: 0.5, color: 0.5, model: 6, trig: 0, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.05

// MiBraids ; 1=morph ; some modulation
var mod = LFNoise1.kr(0.5) * 0.5 + 0.5;
MiBraids.ar(pitch: 40, timbre: mod, color: 0, model: 1, trig: 0, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.05

// MiBraids ; 21=vosim
var pitch = LFNoise0.kr(4).range(33, 66).round;
var timbre = LFNoise1.kr(0.3,0.5,0.5);
var color = LFNoise1.kr(0.3,0.5,0.5);
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: 21, trig: 0, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.1

// MiBraids ; 31=fluted
var pitch = 38;
var timbre = MouseX.kr(0.7, 1, 0, 0.2);
var color = MouseY.kr(0, 1, 0, 0.2);
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: 31, trig: 0, resamp: 1, decim: 0, bits: 0, ws: 0).dup(2) * 0.1

// MiBraids ; scanning
var pitch = MouseY.kr(33, 72, 0, 0.2);
var timbre = LFNoise1.kr(0.3) * 0.5 + 0.5;
var color = LFNoise1.kr(0.3) * 0.5 + 0.5;
var model = MouseX.kr(0, 47, 0, 0.2);
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: model, trig: 0, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.1

// MiBraids ; 40=paraphonic
var timbre = LFNoise1.kr(0.03) * 0.5 + 0.5;
var color = LFNoise1.kr(0.05) * 0.5 + 0.5;  // chord
MiBraids.ar(pitch: 38, timbre: timbre, color: color, model: 40, trig: 0, resamp: 1, decim: 0, bits: 0, ws: 0).dup(2) * 0.1

// MiBraids ; trigger ; 28=plucked
var trig = Dust.kr(0.6);
var pitch = TRand.kr(45, 72, trig).rounded;
var timbre = 0.5;
var color = LFNoise1.kr(0.3) * 0.5 + 0.5;
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: 28, trig: trig, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.1

// MiBraids ; 34=kick
var trig =  Impulse.kr(4, 0);
var pitch = LinLin.kr(Latch.kr(PinkNoise.kr(), trig), -1, 1, 30, 50).rounded;
var timbre = LFNoise1.kr(0.4) * 0.5 + 0.5;
var color = LFNoise1.kr(0.3) * 0.5 + 0.5;
MiBraids.ar(pitch: pitch, timbre: timbre, color: color, model: 34, trig: trig, resamp: 0, decim: 0, bits: 0, ws: 0).dup(2) * 0.2

// MiBraids ; 34=kick ; sample rate, bit reduction and distortion
var trig =  CoinGate.kr(0.3, Impulse.kr(4, 0));
var decim = TRand.kr(1,32,trig);
var ws = LinLin.kr(LFTri.kr(0.2, 0), -1, 1, 0,1);
MiBraids.ar(pitch: 40, timbre: 0.7, color: 0.7, model: 34, trig: trig, resamp: 2, decim: decim, bits: 3, ws: ws).dup(2) * 0.1

// MiClouds ; basic granulation ; requires=buf (stereo)
arg buf = 0;
var nc = 2;
var input = PlayBuf.ar(nc, buf, 1, loop: 1);
var dens = LFNoise1.kr(0.3).range(0.3, 0.45);
MiClouds.ar(input, 0, 0, 0, dens, 0.5, drywet: 1, mode: 0)

// MiClouds
var imp = Dust.ar([0.8, 1.1]);
var freq = Latch.ar(PinkNoise.ar() * 24 + 80,  imp).midiCps;
var inputArray = RLPF.ar(imp,  freq,  0.002) * 4;
var pit = LFNoise1.kr(0.3) * 12;
var pos = LFNoise2.kr(0.4) * 0.5 + 0.5;
var size = LFNoise1.kr(0.3) * 0.5 + 0.5;
var dens = LFNoise1.kr(0.3) * 0.5 + 0.5;
var tex = LFNoise1.kr(0.3) * 0.5 + 0.5;
var freeze = LFClipNoise.kr(0.3);
MiClouds.ar(inputArray: inputArray, pit: pit,  pos: pos,  size: size,  dens: dens,  tex: tex,  drywet: 0.5,  in_gain: 2,  spread: 0.5, rvb: 0.3,  fb: 0.8,  freeze: freeze,  mode: 0, lofi: 1,  trig: 0)

// MiClouds ; using external grain trigger
arg buf = 0;
var nc = 2;
var input = PlayBuf.ar(nc, buf, 1, loop: 1);
var dens = 0.5;
var trig = Dust.kr(10);
MiClouds.ar(input, -5, 0, 0.2, dens, 0.5, trig: trig, drywet: 1, mode: 0)

// MiClouds ; spectral mode (this mode causes high CPU peaks)
arg buf = 0;
var nc = 2;
var input = PlayBuf.ar(nc, buf, 1, loop: 1);
var size = 0.35;
var dens = 0.02;
var tex = 0.3;
MiClouds.ar(input, 0, 0, size, dens, tex, drywet: 1, rvb: 0.8, fb: 0.8, mode: 3) * 0.35

// MiClouds ; more spectral stuff ; watch volume
arg buf = 0;
var nc = 2;
var input = PlayBuf.ar(nc, buf, 1, loop: 1);
var size = LFNoise1.kr(0.2).range(0.1,0.5).squared;
var dens = LFNoise1.kr(0.3,0.5,0.5);
var tex = LFNoise1.kr(0.3,0.5,0.5);
MiClouds.ar(input, 0, 0, size, dens, tex, drywet: 1, rvb: 0.6, fb: 0.6, lofi: 1, mode: 3) * 0.25

// MiElements ; basic
var blow_in = PinkNoise.ar() * 0.3;
var gate = LFPulse.kr(2, 0, 0.5);
var pit = 45;
MiElements.ar(blow_in: blow_in, strike_in: 0, gate: gate, pit: pit, strength: 0.5, contour: 0.2, bow_level: 0, blow_level: 0, strike_level: 0, flow: 0.5, mallet: 0.5, bow_timb: 0.5, blow_timb: 0.5, strike_timb: 0.5, geom: 0.25, bright: 0.5, damp: 0.7, pos: 0.2, space: 0.3, model: 0, easteregg: 0)

// MiElements ; ringing ; use 'blow' input and contour set to 0.5
var blow_in = PinkNoise.ar() * 0.3;
var gate = 1;
MiElements.ar(blow_in: blow_in, strike_in: 0, gate: gate, pit: 48, strength: 0.5, contour: 0.5)

// MiElements ; ringing ; use the 'strike' input (which bypasses the exciter section)
var strike_in = PinkNoise.ar() * 0.3;
MiElements.ar(blow_in: 0, strike_in: strike_in, gate: 0, pit: 48)

// MiElements ; bow
var mod = LFNoise1.kr(0.3) * 0.5 + 0.5;
MiElements.ar(gate: 1, pit: 32, contour: 0.5, bow_level: 1, bow_timb: mod) * 0.25

// MiElements ; blow
var pit = LinLin.kr(LFNoise0.kr(0.1), -1, 1, 32, 44);
var flow = LFNoise1.kr(0.4) * 0.5 + 0.5;
var blow_timb = LFNoise1.kr(0.2) * 0.5 + 0.5;
MiElements.ar(blow_in: 0, strike_in: 0, gate: 1, pit: pit, strength: 0.5, contour: 0.5, bow_level: 0, blow_level: 0.6, strike_level: 0, flow: flow, mallet: 0.5, bow_timb: 0.5, blow_timb: blow_timb) * 0.25

// MiElements ; blow ; contour
var gate = LFPulse.kr(1, 0.01, 0.5);
var pit = SinOsc.kr(5, 0) * 0.1 + 53;
var contour = LinLin.kr(SinOsc.kr(0.8, 0), -1, 1, 0, 1);
var flow = LinLin.kr(LFNoise1.kr(0.1), -1, 1, 0, 1);
MiElements.ar(blow_in: 0, strike_in: 0, gate: gate, pit: pit, strength: 0.5, contour: contour, bow_level: 0, blow_level:0.5, strike_level: 0, flow: flow, mallet: 0.5, bow_timb: 0.5, blow_timb: 0.3, strike_timb: 0.5, geom: 0.25, bright:0.3, damp:0.8)

// MiElements ; metal, bells
var trig = Dust.ar(2.5);
var input = Decay.ar(trig, 0.01);
var g = TBrownRand.ar(0.5, 0.9, 0.2, trig: CoinGate.ar(0.05, trig));
var space = LFNoise1.kr(0.1).range(0.5, 1);
MiElements.ar(0, input, 0, 40, geom: g, bright:0.4, damp:0.9, space: space)

// MiElements ; strike input ; playing chords ; model=2=strings
var strike_in = Decay.ar(Dust.ar(1), 0.01);
var geom = LFNoise1.kr(0.1,0.5,0.5);
MiElements.ar(blow_in: 0, strike_in: strike_in, pit: 53, geom: geom, bright:0.5, damp:0.9, model:2)

// MiElements ; mallets ; strength
var gate = CoinGate.kr(0.4, Impulse.kr(6));
var stren = TRand.kr(trig: gate);
var strike_timbre = LFNoise1.kr(0.3,0.5,0.5);
MiElements.ar(gate: gate, pit:40, strength: stren, strike_level: 0.5, mallet:0.7, strike_timb: strike_timbre, bright: 0.3, damp: 0.85, space: 0.6)

// MiElements ; mallets ; particles
var strike_timbre = LFNoise1.kr(0.3,0.5,0.5);
var g = LFNoise2.kr(0.1).range(0.4,0.7);
var maltype = 1; // mallet type: 1 --> uses internal model of bouncing particles
MiElements.ar(gate: 1, pit:40, geom: g, contour:0.5, strike_level: 0.5, mallet: maltype, strike_timb: strike_timbre)

// MiElements ; easteregg: 2x2-op FM synth
var mod = LFNoise1.kr(0.3) * 0.5 + 0.5;
var ratio = 0.25;
var ratio2 = 0.25;
var ratio3 = 0.51;
MiElements.ar(gate:1, contour: 0.5, pit: 48, bow_level: ratio, blow_level: 0.6, strike_level: 0.5, flow: ratio2, mallet: ratio3, bow_timb: mod, blow_timb: 0.3, strike_timb: 0.6, strength: 0.9, geom: 0.12, bright: 0.6, damp: 0.5, space: 0.7, easteregg: 1)

// MiOmi ; basic
MiOmi.ar(pit: 50, level1:1, level2:0.5, ratio1:0.49, fm1:0.5) * 0.25

// MiOmi ; external FM
var freq = MouseX.kr(2, 1000, 0, 0.2);
var amp = MouseY.kr(0, 1, 0, 0.2);
var audio_in = SinOsc.ar(freq, 0) * amp;
MiOmi.ar(audio_in: audio_in, pit: 40, fm1: 0.5, fm2: 0.5, xfb: 0.1, cutoff: 0.9)

// MiOmi ; filter and cutoff modulation
var filter_mode = LinLin.kr(LFTri.kr(0.23, 0), -1, 1, 0, 1);
var gate = LFPulse.kr(6, 0, 0.2);
var cutoff = LinLin.kr(LFTri.kr(0.2, 0), -1, 1, 0, 0.5);
MiOmi.ar(audio_in: 0, gate: gate, pit: 48, contour: 0.1, fm1: 0.5, fm2: 0.5, fb:0.5, strength: 0, filter_mode: filter_mode, cutoff: cutoff, env: 0.5)

// MiOmi ; cross feedback
var xfb = LinLin.kr(LFTri.kr(0.2, 0), -1, 1, 0, 1);
MiOmi.ar(pit: 43, xfb: xfb) * 0.25

// MiPlaits ; basics
MiPlaits.ar(35, 0, harm: 0.252, morph: 0.2, mul: 0.1)

// MiPlaits ; Mouse control
MiPlaits.ar(48, 2, MouseX.kr(0, 1), MouseY.kr(0,1), mul: 0.1)

// MiPlaits ; some talking
MiPlaits.ar(MouseY.kr(24,72), 7, MouseX.kr(0, 1),  0.5, LFSaw.ar(0.11, 0, 0.5, 0.5)) * 0.1

// MiPlaits ; scanning through some engines + vibrato
var pit = 50;
var vib = SinOsc.ar(6, 0, 0.3);
var e = LFNoise0.kr(0.5, 4, 4);
MiPlaits.ar(pit+vib, e, mul: 0.1)

// MiPlaits ; some FM
var harm = MouseX.kr(0, 1);
var timbre = MouseY.kr(0,1);
var morph = LFNoise2.kr(0.2).range(0,1);
var trigger = Impulse.ar(8);
MiPlaits.ar(48, 2, harm,  timbre, morph, trigger, decay: 0.5) * 0.1

// MiPlaits ; wavetable + trigger
var trigger = Impulse.kr(8);
var harm = LFNoise2.kr(0.3,0.25,0.25);
var timbre = LFNoise1.kr(0.4,0.5,0.5);
var dec = LFNoise2.kr(0.2).range(0.01,0.8);
MiPlaits.ar(44, 5, harm, timbre, 0, trigger, decay: dec, mul: 0.2)

// MiPlaits ; some chords + trigger + level
var harm = MouseY.kr(0, 1, 0, 0.2);  // select chord
var timbre = 0.5;
var morph = 0.5;
var trigger = Impulse.kr(6, 0);
var lev = TRand.kr(0, 1, trigger);
MiPlaits.ar(40, 6, harm, timbre, morph, trigger, lev.squared, decay: 0.5, timb_mod: 0.4, mul: 0.1)

// MiPlaits ; super saw
var harm = 0.16;
var timbre = 0;
var morph = 1;
var pit = TIRand.kr(39, 49, Dust.kr(0.5));
MiPlaits.ar(pit, 8, harm, timbre, morph, mul: 0.1)

// MiPlaits ; slow swarm
var harm = 0.9;
var timbre = 0;
var morph = 0.5;
MiPlaits.ar(48, 8, harm, timbre, morph) * [0.04, 0.15]

// MiPlaits ; inharmonic string
var harm = LFNoise2.kr(0.2).range(0,1);
var timbre = 0.0;
var morph = 0.85;
MiPlaits.ar(60, 11, harm, timbre, morph)

// MiPlaits ; modal resonator + trigger
var harm = LFNoise2.kr(0.2).range(0,1);
var timbre = 0.0;
var morph = 0.85;
var trigger = Impulse.kr(1);
var lev = TRand.kr(trig: trigger).squared;
Mix.ar(MiPlaits.ar(56, 12, harm, timbre, morph, trigger, lev))

// MiPlaits ; snare drums
var harm = LFNoise2.kr(0.5).range(0,0.5);
var timbre = 0.173;
var morph = 0.827;
var trigger = Impulse.kr(8);
var lev = TRand.kr(trig: trigger).squared;
MiPlaits.ar(47, 14, harm, timbre, morph, trigger, lev, fm_mod: 0.2, timb_mod: 0.43, decay: 0.4) * 0.1

// MiPlaits ; filtered noise
var harm = 0.575;
var timbre = 0.02;
var morph = LFNoise1.kr(0.3).range(0.55,0.9); // filter resonance
MiPlaits.ar(62, 9, harm, timbre, morph) * 0.25

// MiPlaits ; something...
var trigger = Dust.kr(LFNoise2.kr(0.1).range(0.1,7));
var harmonics = SinOsc.kr(0.03, 0).range(0.0,1.0);
var timbre = LFTri.kr(0.07, 0).range(0.0,1.0);
var morph = LFTri.kr(0.11, 0).range(0.0,1.0).squared;
var pitch = TIRand.kr(24, 48, trigger);
var engine = TRand.kr(0, 15, trig: trigger).round;
var sub = SinOsc.ar(pitch.midicps, 0, 0.1);
var mi = MiPlaits.ar( pitch, engine, harmonics, timbre, morph, trigger: trigger, decay: 0.8, lpg_colour: 0.2, mul: 0.5);
(mi + sub) * 0.2

// MiRings ; basics
var in = Impulse.ar(1, 0);
MiRings.ar(in: in, trig: 0, pit: 60, struct: 0.25, bright: 0.5, damp: 0.7, pos: 0.25, model: 0, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0)

// MiRings ; basics
var in = PinkNoise.ar() * 0.05;
MiRings.ar(in: in, trig: 0, pit: 40, struct: 0.25, bright: 0.5, damp: 0.7, pos: 0.25, model: 0, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0)

// MiRings ; using the 'trig' input to excite the resonator
var trig = Dust.kr(0.7);
var model = 1;
MiRings.ar(in: 0, trig: trig, pit: 38, struct: 0.25, bright: 0.5, damp: 0.7, pos: 0.25, model: model, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0) * 0.2

// MiRings ; using the 'pit' input to set midi pitch and excite the resonator
var pit = LinLin.kr(LFNoise0.kr(2), -1, 1, 30, 50);
var model = 2;
MiRings.ar(in: 0, trig: 0, pit: pit, struct: 0.25, bright: 0.5, damp: 0.7, pos: 0.25, model: model, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0) * 0.5

// MiRings ; sympathetic strings
var trig = Dust.kr(1);
var pit = Latch.kr(WhiteNoise.kr(), trig).range(30, 60).round;
var struct = LinLin.kr(LFNoise2.kr(0.4), -1, 1, 0, 1);
var model = 1;
var poly = 4;
MiRings.ar(in: 0, trig: 0, pit: pit, struct: struct, bright: 0.5, damp: 0.7, pos: 0.25, model: model, poly: poly, intern_exciter: 0, easteregg: 0, bypass: 0) * 0.5

// MiRings ; inharmonic string
var trig = Dust.kr(3);
var pit = Latch.kr(WhiteNoise.kr(), Dust.kr(0.5)).range(30, 60);
var struct = Latch.kr(PinkNoise.kr(), trig).range(0.1, 1);
var damp = 0.8;
var model = 2;
var poly = 4;
MiRings.ar(in: 0, trig: trig, pit: pit, struct: struct, bright: 0.5, damp: damp, pos: 0.25, model: model, poly: poly, intern_exciter: 0, easteregg: 0, bypass: 0) * 0.25

// MiRings ; simple vibrato
var trig = Dust.kr(0.5);
var pit = Latch.kr(WhiteNoise.kr(), trig).range(36, 48) + SinOsc.kr(3, 0);
MiRings.ar(in: 0, trig: 0, pit: pit, struct: 0.2, bright: 0.5, damp: 0.7, pos: 0.25, model: 0, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0)

// MiRings ; 'intern_exciter' OFF
MiRings.ar(PinkNoise.ar(0.1), Impulse.kr(1), poly: 2) * 0.25

// MiRings ; 'intern_exciter' ON
MiRings.ar(PinkNoise.ar(0.1), Impulse.kr(1), intern_exciter: 1, poly: 2) * 0.25

// MiRings ; intern_exciter ON
var input = Crackle.ar(1.999, 0.2);
var trig = Dust.ar(0.7);
var bright = LFNoise1.kr(0.4).range(0.1,0.8);
var pos = LFNoise2.kr(0.1).range(0,1);
MiRings.ar(input, trig, 56, 0.1, bright, 0.6, pos, intern_exciter: 1, model:0, poly: 3) * 0.35

// MiRings ; 2-op_FM ; 'pos' controls feedback (no fb at 0.5)
var input = Impulse.kr(6);
var pitch = Latch.kr(WhiteNoise.kr(), input).range(24, 48).round;
var brightness = LFNoise1.kr(0.5).range(0.2,0.9);
var position = LFNoise1.kr(0.4).range(0,0.5);
var out = MiRings.ar(input, pit: pitch, bright: brightness, pos: position, damp: 0.97, model: 3);
Splay.ar(out, LFNoise2.kr(0.5).range(-0.5,0.5)) * 0.25

// MiRings ; sympathetic_string_quantized --> chords
var input = PinkNoise.ar(0.2);
var bright = LFNoise2.kr(0.5).range(0.15, 1);
var struct = LFNoise0.kr(0.2).range(0,1);
MiRings.ar(input, 0, 40, struct, bright, 0.7, 0.25, model:4, poly: 1) * 0.35

// MiRings ; string_and_reverb --> spacey ; force 'internal exciter'
var input = PinkNoise.ar(0.2);
var trig = Dust.kr(0.7);
var struct = LFNoise1.kr(0.4).range(0,1);
var pos = LFNoise2.kr(0.1).range(0,1);
MiRings.ar(input, trig, 60, struct, 0.5, 0.7, pos, intern_exciter: 1, model:5, poly: 4) * 0.25

// MiRings ; easter egg
var trig = Impulse.kr(0.3);
var pitch = Latch.kr(WhiteNoise.kr(), trig).range(24, 48).round;
var brightness = LFNoise1.kr(0.5).range(0.2,0.9);
var position = LFNoise1.kr(0.4).range(0,1);
MiRings.ar(pit: pitch, bright: brightness, pos: position, damp: 0.8, poly: 1, model: 0, easteregg: 1) * 0.25

// MiRings ; easter egg --> drone ; set damp to 1.0 to get a sustaining sound that doesn't need to be triggered
var struct = LFNoise2.kr(0.2).range(0,1);
var brightness = LFNoise1.kr(0.5).range(0,1);
MiRings.ar(pit: 40, struct: struct, bright: brightness, pos: 0.9, damp: 1.0, poly: 2, model: 2, easteregg: 1) * 0.25

// MiRipples ; basic
MiRipples.ar(Saw.ar(60), 0.4, 0.3)

// MiRipples
var cf = LFNoise0.kr(4).range(0, 1);
MiRipples.ar(Saw.ar(60), cf, 0.6, mul: 0.5)

// MiRipples ; filter sweep + distortion
var cf = LFTri.kr(0.03).range(0.1,0.9);
MiRipples.ar(Saw.ar(40), cf, 0.8, 4, 0.2)

// MiRipples
var trig = Impulse.ar(4);
var input = Decay.ar(trig, 0.1);
var cf = TRand.ar(0.1, 0.6, trig);
var filt = RLPF.ar(cf, 80, 0.3);
MiRipples.ar(input, filt, 0.8, drive: 3, mul: 0.5)

// MiTides ; shape
var shape = LFTri.ar(0.11).range(0,1);
MiTides.ar(100, shape, output_mode: 2, mul: 0.5)

// MiTides ; slope
var slope = LFTri.ar(0.11).range(0,1);
MiTides.ar(100, 0.5, slope, output_mode: 2, mul: 0.5)

// MiTides ; phasing
var shape = 0.2;
var slope = 0.0;
var shift = LFNoise1.ar(0.3).range(0,1);  // slightly shift phases
var smooth = LFNoise1.kr(0.02).range(0.1, 0.9);
var out = MiTides.ar(70, shape, slope, smooth, shift, output_mode: 2) * 0.15;
Splay.ar(out)

// MiTides ;chords ; tremolo
var shape = LFTri.ar(0.11).range(0,1);
var slope = LFTri.ar(0.2).range(0,1);
var chord = LFNoise1.ar(0.1).range(0.5,1);
var smooth = SinOsc.ar(LFNoise1.kr(0.2).range(0.1,10)).range(0,0.5);
var out = MiTides.ar(200, shape, slope, smooth, chord, output_mode: 3, mul: 0.25);
Splay.ar(out)

// MiTides ; amplitude mode
var freq = 0.15;
var shape = 0.2;
var slope = 0.2;
var level = LFTri.ar(0.1).range(0,1);
var env = MiTides.ar(freq, shape, slope, 0.3, level, output_mode: 1, ramp_mode: 1);
var sines = SinOsc.ar([200,300,500,900]);
Splay.ar(sines * env)

// MiTides ; amplitude ; trigger input
var freq = LFNoise1.ar(0.8).range(0.2,10);
var shape = 0.2;
var slope = 0.2;
var level = LFNoise1.ar(0.3).range(0,1);
var trig = LFPulse.ar(2);
var env = MiTides.ar(freq, shape, slope, 0.3, level, trig: trig, output_mode: 1, ramp_mode: 0);
var sines = SinOsc.ar([200,300,500,700]);
Splay.ar(sines * env * 0.5)

// MiTides ; phasing envs
var freq = 10;
var shape = 0.2;
var slope = 0.5;
var shift = LFTri.ar(0.1).range(0,1);
var trig = LFPulse.ar(5);
var env = MiTides.ar(freq, shape, slope, 0.5, shift, trig: trig, output_mode: 2, ramp_mode: 0);
var sines = SinOsc.ar([200,300,500,700]);
Splay.ar(sines * env * 0.25)

// MiTides ; gate
var freq = 5;  // attack rate
var shape = LFTri.ar(0.13).range(0,1);
var slope = 0.5;
var smooth = LFTri.ar(0.1).range(0,1);
var trig = LFPulse.ar(1);
var env = MiTides.ar(freq, shape, slope, smooth, 0.8, trig: trig, output_mode: 0, ramp_mode: 0);
var sine = PMOsc.ar(150, 300, 2);
sine * env[0]

// MiTides ; Lightbath -- Loom 4
var bpm = 140;
var period = (60 / bpm) * 6;
var speed = 1.0 / period;
var del_times = period / [6, 8];
var trig = Impulse.kr(speed);
var clock = Phasor.kr(trig);
var pit = TChoose.kr(trig, [67, 60, 65]);
var shape = LFTri.kr(0.11).range(0,1);
var slope = LFTri.kr(0.11).range(0.5,0.8);
var smooth = LFNoise1.kr(0.07).range(0.25,0.7);
var chord = LFNoise1.kr(0.03).range(0.0,0.5);
var oscs = MiTides.ar(pit.midicps, shape, slope, smooth, chord);
var envs = MiTides.ar(speed, 0.35, 0, 0.46, 0.92, clock: clock, ratio: 9, rate: 0);
var scaler = LFNoise1.kr( [0.1, 0.07, 0.11, 0.05] );
var mix = oscs * envs * scaler;
var out = Splay.ar(mix, center: LFTri.kr(0.1));
var del = CombL.ar(out, 2, del_times, 6, mul: 0.5);
out + del

// MiVerb ; basic
MiVerb.ar(Impulse.ar(1))

// MiVerb ; stereo ; with freezing
var imp = Dust.ar([0.7, 0.8]);
var freq = Latch.ar(PinkNoise.ar(24,80), imp).midicps;
var input = RLPF.ar(imp, freq, 0.002, 3);
var freez = TRand.kr(-1, 1, Dust.kr(0.7));
var revtime = 0.8;
var drywet = 0.5;
var damping = 0.3;
var diff = LFNoise1.kr(0.1,0.5,0.5);
MiVerb.ar(input, revtime, drywet, damping, freeze: freez)

// MiVerb ; reverb time (> 1)
var freq = LFNoise0.kr(0.3).range(400, 2500);
var input = RLPF.ar(Impulse.ar(0.3), freq, 0.1);
var time = LFNoise2.kr(0.3, 0.1, 1.03);   // modulate rev time above and below 1.0!
var damp = LFNoise2.kr(0.2).range(0, 0.7);
MiVerb.ar(input, time, 0.9, damp, 0.1, mul: 0.5)

// Mix ; summing ; phase cancellation (silence)
Mix.ar([SinOsc.ar(#[440, 441], #[0, pi]), SinOsc.ar(#[440, 441], #[pi, 0])])

// Mix ; phase-shifting ; mouseX delay control
var p = SinOsc.ar(#[440, 441], #[0, pi]) * 0.1;
var q = DelayN.ar(SinOsc.ar(#[440, 441], #[pi, 0]), ControlDur.ir() * 2, MouseX.kr(0, ControlDur.ir() * 2, 0, 0.2)) * 0.1;
Mix.ar([p, q])

// MoogFF
var voiceFunc = {
    arg e;
    var freq = e.x.unitCps;
    var osc = Mix.fill(8, { Saw.ar(freq * TRand.kr(0.99, 1.01, e.w)) * 0.75 });
    var filterEnv = EnvGen.ar(Env.adsr(0.02, 0.1, 0.05, 1, 1, -4, 0), e.w, 1, 0, 1, 0);
    MoogFF.ar(osc, e.y * 750 + 250 * filterEnv, e.rx * 4, 0) * e.w.lagud(0.01, 4) * 2 };
Splay.ar(Voicer.ar(16, voiceFunc))

// MoogVCF
var voiceFunc = {
    arg e;
    var freq = e.p.unitCps;
    var osc = Mix.fill(8, { Saw.ar(freq * TExpRand.kr(0.99, 1.01, e.w)) });
    var amp = e.z * 2 * e.w.lagud(0.02, 4);
    MoogVCF.ar(osc, SinOsc.kr(e.y).exprange(freq * 2, freq * 4), e.rx) * amp };
Splay.ar(Voicer.ar(16, voiceFunc))

// NamedControl ; non-argument notation controls
var freq = NamedControl.ir(name: "freq", values: 220.0);
SinOsc.ar(freq: freq, phase: 0, mul: 0.10)

// Out ; summing ; non phase cancellation
[SinOsc.ar([440,441],[0,pi]) * 0.1, SinOsc.ar([440,441],[pi,0]) * 0.1]

// PlayBuf ; requires=buf
arg buf = 0;
var scl = BufRateScale.kr(buf);
PlayBuf.ar(2,buf,scl,1,0,1,0)

// PlayBuf ; requires=buf
var b = MouseX.kr(32,64,0,0.2);
var r = BufRateScale.kr(b);
PlayBuf.ar(1,b,r,1,0,1,0)

// PMOsc
PMOsc.ar(440, MouseY.kr(1, 550, 0, 0.2), MouseX.kr(1, 15, 0, 0.2), 0) * 0.1

// PMOsc ; carrier and modulator not linked
var tr = Impulse.kr(10, 0);
var c = TRand.kr(100, 5000, tr);
var m = TRand.kr(100, 5000, tr);
PMOsc.ar(c, m, 12, 0) * 0.1

// PMOsc ; modulator expressed as ratio
var carrier = LFNoise0.kr(4) * 500 + 700;
var modRatio = MouseX.kr(1, 2, 0, 0.2);
PMOsc.ar(carrier, carrier * modRatio, 12, 0) * 0.1

// Pulse ; https://nathan.ho.name/posts/integer-ring-modulation/
var freq = 100;
Pulse.ar(freq, 0.5) * Pulse.ar(freq * LFTri.ar(0.3, pi).linlin(-1, 1, 1, 20).round, 0.5) * 0.1;

// Pulse ; interference
Pulse.ar([100, 100.1], 0.5).sum * 0.1

// Rand (UGen)
SinOsc.ar(Rand.ir(220, 440), 0) * 0.1

// Rand
SinOsc.ar({ Rand.ir(220, 440) }.dup(7), 0).splay * 0.1

// Rand (UGen) ; keywords
SinOsc.ar(freq: Rand.ir(lo: 220.0, hi: 440.0), phase: 0, mul: 0.10)

// Rand (UnaryOp) ; ?
var c = NamedControl.ir(name: "c", values: 220.0);
SinOsc.ar(freq: c.rand + c, phase: 0, mul: 0.10)

// Rand2 (UnaryOp)
var c = NamedControl.ir(name: "c", values: 220.0);
SinOsc.ar(freq: c * 2 + c.rand2, phase: 0, mul: 0.10)

// RandRange (BinaryOp)
var c = NamedControl.ir(name: "c", values: 220.0);
SinOsc.ar(freq: c.rrand(c * 2), phase: 0, mul: 0.10)

// RLPF
RLPF.ar(Dust.ar(#[12, 15]), LFNoise1.ar(1 / #[3, 4]) * 1500 + 1600, 0.02)

// RLPF
var freq = Demand.kr(
	Impulse.kr(0.25, 0),
	0,
	Dseq.dr([27, 24, 22, 24] + 2, inf)
).midicps + [0, 0.3];
RLPF.ar(LFPulse.ar(freq, 0, 0.2) * 0.4 - 0.2, 300, 0.5)

// Sieve1
var sieve = [10] ++ { 0.75.rand }.dup(10);
var gap = MouseX.kr(2, 100, 0, 0.2);
Sieve1.ar(sieve.asLocalBuf, gap, 1) * 0.2

// Sieve1
var sieve = [88] ++ { [0.1.rand, 0.5.rand].wchoose([0.8, 0.2]) }.dup(88);
var gap = MouseX.kr(1, 100, 0, 0.2);
Sieve1.ar(sieve.asLocalBuf, gap, 1) * 0.2

// Sieve1
var sieve = [88] ++ { [0.1.rand, 0.5.rand].wchoose([0.8, 0.2]) }.dup(88);
var gap = MouseX.kr(90, [180, 270], 0, 0.2);
var stoch = Sieve1.ar(sieve.asLocalBuf, gap, 1);
var env = Decay2.ar(stoch.abs, 0.01, MouseY.kr(0.1, 1, 0, 0.2));
var freq = Decay2.ar(stoch, 0.01, MouseY.kr(0.5, 1, 0, 0.2)) * 110 + 440;
SinOsc.ar(freq, 0) * env * 0.1

// SinOsc ; phase value = (0, 2 * pi), offset to lowest and midpoint ascending
SinOsc.ar(110, 2 * pi * [0.75, 0]) * 0.1

// SinOsc ; phase cancellation
Mix.ar(SinOsc.ar(440, [0, pi]))

// SinOsc ; phase modulation
SinOsc.ar(MouseY.kr(1, 880, 0, 0.2), SinOsc.kr(MouseX.kr(0, 10, 0, 0.2))) * 0.1

// sin ; https://scsynth.org/t/6256/7 ; sinusoid with a variable-slope Triangular Phase
var freq = 130;
var width = LFTri.ar(0.1, 0).linlin(-1, 1, 0.01, 0.99);
var phasor = Phasor.ar(0, freq * SampleDur.ir, width.neg, 1 - width, 0);
phasor = phasor.bilin(0, width.neg, 1 - width, 0, -1, 1);
phasor = (phasor.abs * 1.5).wrap(0,1);
(phasor * 2 * pi).sin * 0.1

// sin ; https://scsynth.org/t/6256/7 ; sinusoid with a variable-slope ramp phase
var freq = 130;
var width = LFTri.ar(0.1, 0).linlin(-1, 1, 0.01, 0.99);
var phasor = Phasor.ar(0, freq * SampleDur.ir, width.neg, 1 - width, width.neg, 0);
phasor = phasor.bilin(0, width.neg, 1 - width, 0, -0.5, 1);
phasor = Select.ar(phasor > 0, [0.5 + phasor, phasor]);
(phasor * 2 * pi).sin * 0.1

// SinOsc ; https://llllllll.co/t/45623/25
var freqBase = 200;
var freqRes = MouseY.kr(100, 1200, 0, 0.2);
var pdbase = Impulse.ar(freqBase, 0);
var pd = Phasor.ar(pdbase, 2 * pi* freqBase / SampleRate.ir, 0, 2 * pi, 0);
var pdres = Phasor.ar(pdbase, 2 * pi * freqRes / SampleRate.ir, 0, 2 * pi, 0);
var pdi = LinLin.ar((2 * pi - pd).max(0), 0, 2 * pi, 0, 1);
Lag.ar(SinOsc.ar(0, pdres) * pdi, 1 / freqBase)

// SinOsc ; https://scsynth.org/t/6264/9 (es)
var freq = [440, 880];
var k = 12000 * (SampleRate.ir()  / 44100) / (freq * freq.log10);
var sinSig = SinOsc.ar(freq, 0);
var cosSig = SinOsc.ar(freq, pi / 2);
var sqSig = (sinSig * k).tanh;
var sawSig = sqSig * (cosSig + 1) * 0.5;
sawSig

// SinOsc ; https://scsynth.org/t/6264/8 (fm)
var  freq = 110;
var indexLimit = 1.5;
var index = LinLin.ar(SinOsc.ar(1 / 10, 3 * pi / 2), -1, 1, 1, indexLimit);
var phase = index * LocalIn.ar(1, 1);
var sig = SinOsc.ar(freq, phase) + SinOsc.ar(freq * 0.001, index * LocalIn.ar(1, 1)).softclip;
LocalOut.ar(sig);
sig * 0.1

// SinOsc
1.to(5). collect({
	arg n;
	Pan2.ar(SinOsc.ar(n * 100, 0) * 0.max(LFNoise1.kr(6) + Ln.kr(1, -1, 30)), Rand.ir(-1, 1), 0.1)
}).sum

// SinOscFB
SinOscFB.ar([400, 301], MouseX.kr(0, 4, 0, 0.2)) * 0.1

// SinOscFB
var y = MouseY.kr(10, 1000, 1, 0.2);
var x = MouseX.kr(0.5 * pi, pi, 1, 0.2);
SinOscFB.ar(y, x) * 0.1

// SinOscFB
var y = MouseY.kr(1, 1000, 1, 0.2);
var x = MouseX.kr(0.5 * pi, pi, 1, 0.2);
SinOscFB.ar(100 * SinOscFB.ar(y, 0) + 200, x) * 0.1

// SineShaper
SineShaper.ar(SinOsc.ar([400, 404], 0) * 0.2, MouseX.kr(0, 1, 0, 0.2))

// SineShaper
SineShaper.ar(SoundIn.ar, MouseX.kr(0, 1, 0, 0.2))

// Slew
var x = MouseX.kr(200, 12000, 1, 0.2);
var y = MouseY.kr(200, 12000, 1, 0.2);
[Slew.ar (0 - Saw.ar(440), x, y) * 0.05, Slew.ar(LFPulse.ar(800, 0, 0.5), x, y) * 0.1]

// Slew ; square to triangle ; triangle to sin-like ; https://scsynth.org/t/5208/2 (sp)
var freq = 440;
var square = LFPulse.ar(freq, 0, 0.5) * 2 - 1;
var tri = Slew.ar(square, freq * 4, freq * 4);
var sin = LinLin.ar(tri > 0, 0, 1, -1, 1) * (tri.abs ** (1 / 4));
XFade2.ar(tri, sin, MouseX.kr(-1, 1, 0, 0.2), 0.05)

// Squine ; sinewave
Squine.ar(220, 0, 0, 0) * 0.1

// Squine ; squarewave sweeping to pulse
Squine.ar(220, 1, Ln.kr(0, 1, 10), 0) * 0.1

// Squine ; morphing waveform
Squine.ar(220, SinOsc.kr(0.2, 0) * 0.5 + 0.5, SinOsc.kr(0.13, 0), 0) * 0.1

// Squine ; audio-rate morphing waveform
Squine.ar(220, SinOsc.kr(0.2, 0) * 0.5 + 0.5, SinOsc.ar(130, 0), 0) * 0.1

// Squine ; hardsync rising over 20 secs
Squine.ar(100, SinOsc.kr(0.3, 0) * 0.2 + 0.5, 1, Impulse.ar(XLn.kr(5, 500, 20))) * 0.1

// Squine ; compare with SinOsc
[
    SinOsc.ar(SinOsc.ar(XLn.kr(1, 1000, 9), 0) * 200 + 800, 0) * 0.1,
	Squine.ar(SinOsc.ar(XLn.kr(1, 1000, 9), 0) * 200 + 800, 0.5, 0.5, 0) * 0.1
]

// Squine ; fm patch
Squine.ar(
    Squine.ar(100, SinOsc.ar(0.3, 0) * 0.5 + 0.5, Ln.ar(-1, 1, 20), 0) * 200 + 300,
    SinOsc.ar(0.3, 0) * 0.5 + 0.5,
    SinOsc.ar(1.1, 0),
    iminsweep: 4
) * 0.1

// Summer
SinOsc.ar(Summer.kr(Impulse.kr(5, 0), 1.5, 0, 0).poll * 100, 0) * 0.1

// Summer
var trig = Dust.kr(5);
var reset = Impulse.kr(0.5);
SinOsc.ar(Summer.kr(trig, [0.5, 0.25], reset, 1) * 100, 0) * 0.1

// TGrains ; demand ugens as inputs ; requires=buf ; (Warning: empty sequence in Dseq - Server 'localhost' exited with exit code 0)
arg buf = 0;
var trate = MouseX.kr(1, 100, 1);
var d = { Dwhite(0.1, 0.2, 1) };
var z = { Drand([Dgeom(0.1, 1 + d.value, Diwhite(20, 40, 1)), Dgeom(1, 1 - d.value, Diwhite(20, 40, 1))], 1) };
TGrains.ar(
    numChannels: 2,
    trigger: Impulse.ar(trate),
    bufnum: buf,
    rate: Dseq([1, 1, z.value, 0.5, 0.5, 0.2, 0.1, 0.1, 0.1, 0.1], inf) * 2 + 1,
    centerPos: Dseq(z.dup(8), inf),
    dur: Dseq([1, d.value, 1, z.value, 0.5, 0.5, 0.1, z.value] * 2, inf) / trate,
    pan: Dseq([1, 1, 1, 0.5, 0.2, 0.1, 0, 0, 0], inf) * 2 - 1,
    amp: Dseq([1, 0, z.value, 0, 2, 1.0, 1, 0.1, 0.1], inf))

// TRand
var t = Impulse.ar(7, 0) * SinOsc.ar(331, 0);
var e = Decay2.ar(t, { TRand.ar(0.01, 0.05, t) }.dup, { TRand.ar(0.05, 0.15, t) }.dup);
RLPF.ar(LFSaw.ar(TRand.ar(321, 333, t), 0), (LFNoise1.ar(2) * 4 + 100).midicps, 1) * e

// TwoPole
TwoPole.ar(WhiteNoise.ar(), 2000, 0.95) * 0.005

// TwoPole
TwoPole.ar(WhiteNoise.ar(), XLine.kr(800, 8000, 8), 0.95) * 0.005

// TwoPole
TwoPole.ar(WhiteNoise.ar(), MouseX.kr(800, 8000, 1, 0.2), 0.95) * 0.005

// TwoZero
TwoZero.ar(WhiteNoise.ar(), XLine.kr(20, 20000, 8), 1) * 0.125

// TXLine
var trigger = Impulse.ar(0.25, 0);
var gainEnv = Decay2.ar(trigger, 0.01, 1);
Pan2.ar(Saw.ar(TXLine.ar(100, 1000, 0.1, trigger)), TLine.ar(-1, 1, 0.75, trigger), gainEnv)

// UGen.linlin ; note Clip UGen
SinOsc.ar(Sweep.kr(0, 1).linlin(0, 1, 110, 220, 'minmax'), 0)

// UGen.linlin (note Clip UGen) ; keyword
SinOsc.ar(freq: Sweep.kr(trig: 0, rate: 1).linlin(inMin: 0, inMax: 1, outMin: 110, outMax: 220, clip: 'minmax'), phase: 0)

// VarSaw ; phase value = (0, 2 * pi), offset to lowest and midpoint ascending
VarSaw.ar(110, 1 * [0, 0.25], 0.5) * 0.1

// Vibrato ; note audio rate input
SinOsc.ar(Vibrato.ar(DC.ar(400), 1, 0.02, 0, 0, 0.04, 0.1, 0, 0), 0) * 0.1

// Vibrato
SinOsc.ar(Vibrato.kr(400, 1, 0.02, 0, 0, 0.04, 0.1, 0, 0), 0) * 0.1

// Vibrato
var x = MouseX.kr(2, 100, 0, 0.2);
var y = MouseY.kr(0, 1, 0, 0.2);
var v = Vibrato.ar(DC.ar(400), x, 0.1, 1, 1, y, 0.1, 0, 0);
SinOsc.ar(v, 0) * 0.1

// Vibrato
var n = LFNoise1.kr(1) * 3 + 7;
var x = MouseX.kr(0, 1, 0, 0.2);
var y = MouseY.kr(0, 1, 0, 0.2);
var v = Vibrato.ar(DC.ar(400), n, x, 1, 1, y, 0.1, 0, 0);
SinOsc.ar(v, 0) * 0.1

// VOSIM
VOSIM.ar(Impulse.ar(100, 0), MouseX.kr(440, 880, 1, 0.2), 3, 0.99) * 0.1

// VOSIM
Splay2.ar(VOSIM.ar(Impulse.ar(110 + [-1, 0, 1], 0), MouseX.kr([110, 220, 440], 880, 1, 0.2), [3, 5, 7], [0.77, 0.88, 0.99])) * 0.1

// VOSIM
Splay2.ar(VOSIM.ar(Impulse.ar(110 + [-1, 0, 1], 0), LinExp.kr(LFNoise2.kr([0.35, 0.25, 0.15]), -1, 1, [110, 220, 440], 880), [3, 5, 7], [0.77, 0.88, 0.99])) * 0.1

// VOSIM
var p = TRand.ar(0, 1, Impulse.ar(6, 0));
var t = Impulse.ar(9 * (1 + (p > 0.95)));
var f = TRand.ar([40, 120, 220], [440, 990, 880], t);
var n = TRand.ar(4, [8, 16, 32], t);
var d = TRand.ar([0.2, 0.4, 0.6], [0.6, 0.8, 1], t);
var a = TRand.ar(0, [0.2, 0.6, 1], t);
var l = TRand.ar(-1, 1, t);
var x = MouseX.kr(0.25, 2, 0, 0.2);
var y = MouseY.kr(0.25, 0.85, 0, 0.2);
var z = 9;
var freq = f * x * LinLin.kr(LFNoise2.kr(z), -1, 1, 0.25, 2);
var decay = d * y * LinLin.kr(LFNoise2.kr(z), -1, 1, 0.25, 2);
Pan2.ar((VOSIM.ar(t, freq, n, decay) * a).sum, l, 0.75)

// XFade2
XFade2.ar(Saw.ar(440), SinOsc.ar(440, 0), LFTri.ar(0.1, 0), 0.1)

//---- ; drawings

// MiTides ; mode=FREQUENCIES
{ MiTides.ar(10, 0.2, 0.7, output_mode: 3) }.plot(1)

// MiTides ; mode=PHASES
{ MiTides.ar(3, 0.2, output_mode: 2) }.plot(1)

//----- ; broken

// VarLag ; note EnvGen UGen
var sqr = LFPulse.kr(1, 0, 0.5).range(100, 400);
var crv = VarLag.kr(sqr, 0.2, Line.kr(-8, 8, 15, doneAction: Done.freeSelf));
SinOsc.ar(crv, 0) * 0.3

// VarLag
PinkNoise.ar(VarLag.kr(0, 0, 0, 5).dup(2))

