// wandering sines ; https://github.com/cianoc/supercollider_fragments
var o = SinOsc.ar((LFNoise1.kr(0.5) * 600 + (LFSaw.kr(1.5, 0) * 50 + 500)).abs, 0) * 0.1;
var d = CombN.ar(o, 3.0, #[1.35, 0.7], 6);
Pan2.ar(o, 0, 1) + d

// random sine waves ; https://github.com/cianoc/supercollider_fragments
var f = { Pan2.ar(SinOsc.ar(SinOsc.ar(1 / 10, 0.0.rrand(6.0)) * 200 + 600, 0), 1.0.rand, 0.05) };
f.dup(15).splay

// nice use of blip ; https://github.com/cianoc/supercollider_fragments
var t = Impulse.kr(6, 0);
var o = Blip.ar(TRand.kr(48, 72, t).midicps, TRand.kr(1, 12, t)) * 0.max(TRand.kr(-0.5, 0.4, t));
var p = Pan2.ar(o, TRand.kr(-1.0, 1.0, t), EnvGen.kr(Env.perc(0, 3, 1, [-4]), t));
var m = Mix.ar({ p }.dup(6)) * 0.2;
m + CombL.ar(m, 2.0, 4/6, 6)

// interesting rising sounds ; https://github.com/cianoc/supercollider_fragments
var f = {arg c; Pan2.ar(SinOsc.ar(LFSaw.ar((c * 0.2 + 1)/3, 0) * 500 + 700, 0), LFNoise0.kr(1), 0.05)};
Mix.ar(f.dup(5))

// use of dust with rising sounds ; https://github.com/cianoc/supercollider_fragments
var f = {
    var d = [{ 1000.exprand(10000) }.dup(3), nil, { 1.0.rrand(4.0) }.dup(15)];
    Pan2.ar(Klank.ar(Ref.new(d), Dust.ar(1/3) * 0.1, 1, 0, 1), LFTri.kr(3.0.rrand(10.0), 0), 0.1) };
Mix.ar(f.dup(20))

// pretty ; nice, but inessential ; https://github.com/cianoc/supercollider_fragments
var f = {
    arg i;
    var freq = MouseX.kr(0.1.rrand(5.0), 3.0.rrand(20.0), 0, 0.2);
    var amp = LFNoise0.kr(MouseX.kr(1.rrand(6), 6.rrand(1), 0, 0.2)).max(0);
    var osc = SinOsc.ar(SinOsc.ar(freq, 0) * MouseY.kr(10, 50, 0.2) + 200.rrand(5000), 0) * amp;
    Pan2.ar(osc, 1.0.rand2, 0.03) };
Mix.fill(12, f)

// random impulses ; https://github.com/cianoc/supercollider_fragments
var f = {
    var freq = 100.exprand(3000);
    var amp = EnvGen.kr(Env.perc(0, (freq ** -0.7) * 100, 1, #[-4]), Dust.kr(1 / 5));
    Pan2.ar(SinOsc.ar(freq * (LFNoise1.kr(1 / 6) * 0.4 + 1), 0) * amp, LFNoise1.kr(1 / 8), 1) };
Mix.fill(15, f) * 0.1

// angry birds ; https://github.com/cianoc/supercollider_fragments
var lfo = LFNoise1.ar(#[28, 27]) * 400 + 2000;
SinOsc.ar(lfo, 0) * 0.1

// lasers ; https://github.com/cianoc/supercollider_fragments
SinOsc.ar(EnvGen.kr(Env.adsr(0.1, 0.4, 0.8, 0.5, 1, #[-4], 0), Dust.kr(1), 10000, 0, 1, 0)) * 0.1

// saw as an lfo ; https://github.com/cianoc/supercollider_fragments
var lfo = LFSaw.ar(freq: 2, mul: -100, add: 600);
SinOsc.ar(lfo, mul: 0.1)

// synched impulses ; https://github.com/cianoc/supercollider_fragments
var synch = 5;
[SinOsc.ar(100, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(3/synch))),
 SinOsc.ar(300, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(7/synch))),
 SinOsc.ar(500, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(5/synch))),
 SinOsc.ar(700, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(2/synch))),
 SinOsc.ar(900, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(9/synch))),
 SinOsc.ar(1100, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(6/synch))),
 SinOsc.ar(1300, mul: EnvGen.kr(Env.perc(0, 1), Impulse.kr(1/synch)))].sum * 0.1

// nice buzzing effect
var speed = 14;
var f = SinOsc.ar(1000, 0, mul:150, add:300);
var t = Impulse.kr(1 / 3, 0);
Mix.ar([
 SinOsc.ar(f * 1, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/1),
 SinOsc.ar(f * 2, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/2),
 SinOsc.ar(f * 3, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/3),
 SinOsc.ar(f * 4, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/4),
 SinOsc.ar(f * 5, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/5),
 SinOsc.ar(f * 6, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/6),
 SinOsc.ar(f * 7, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/7),
 SinOsc.ar(f * 8, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/8),
 SinOsc.ar(f * 9, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/9),
 SinOsc.ar(f * 10, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/10),
 SinOsc.ar(f * 11, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/11),
 SinOsc.ar(f * 12, mul: LFNoise1.kr(speed.rrand(speed * 2), 0.5, 0.5)/12)]) * 0.1

// nice buzzing effect
var speed = 14;
var f = SinOsc.ar(1000, 0) * 150 + 300;
var t = Impulse.kr(1 / 3, 0);
var v = { arg n; SinOsc.ar(f * n, 0) * (LFNoise1.kr(Rand.ir(speed, speed * 2)) * 0.5 + 0.5) / n };
1.to(12).collect(v).sum * 0.1

// additive saw
var f = 100;
var t = Impulse.kr(1 / 3);
Mix.ar([
 SinOsc.ar(f * 1, mul: EnvGen.kr(Env.perc(0, 1.4), t)/1),
 SinOsc.ar(f * 2, mul: EnvGen.kr(Env.perc(0, 1.1), t)/2),
 SinOsc.ar(f * 3, mul: EnvGen.kr(Env.perc(0, 2), t)/3),
 SinOsc.ar(f * 4, mul: EnvGen.kr(Env.perc(0, 1), t)/4),
 SinOsc.ar(f * 5, mul: EnvGen.kr(Env.perc(0, 1.8), t)/5),
 SinOsc.ar(f * 6, mul: EnvGen.kr(Env.perc(0, 2.9), t)/6),
 SinOsc.ar(f * 7, mul: EnvGen.kr(Env.perc(0, 4), t)/7),
 SinOsc.ar(f * 8, mul: EnvGen.kr(Env.perc(0, 0.3), t)/8),
 SinOsc.ar(f * 9, mul: EnvGen.kr(Env.perc(0, 1), t)/9),
 SinOsc.ar(f * 10, mul: EnvGen.kr(Env.perc(0, 3.6), t)/10),
 SinOsc.ar(f * 11, mul: EnvGen.kr(Env.perc(0, 2.3), t)/11),
 SinOsc.ar(f * 12, mul: EnvGen.kr(Env.perc(0, 1.1), t)/12)]) * 0.1

// additive saw
var f = 100;
var t = Impulse.kr(1 / 3, 0);
var dt = [1.4, 1.1, 2, 1, 1.8, 2.9, 4, 0.3, 1, 3.6, 2.3, 1.1];
var v = { arg n; SinOsc.ar(f * n, 0) * Decay2.kr(t, 0.01, dt.nth(n)) / n };
1.to(12).collect(v).sum * 0.1

// lovely bells ; https://github.com/cianoc/supercollider_fragments
var t = Impulse.kr(1 / 3, 0);
var env = EnvGen.kr(Env.perc(0, 1), t, levelScale: 1/(1..6), timeScale: 1.0.rrand(3.0).dup);
Mix.ar(SinOsc.ar([60, 64, 67, 71, 74, 78].midicps, mul: env)) * #[0.1, 0.1]

// interesting drone ; https://github.com/cianoc/supercollider_fragments
var freq = [40, 42, 43, 45, 47, 48, 41, 42].midicps;
var amp = LFNoise1.kr(0.1.rrand(0.5).dup(8), 0.5, 0.5);
Mix.ar(Pan2.ar(SinOsc.ar(freq, mul: amp), 1.0.rand2.dup(8))) * 0.2

// great inharmonic spectrum ; https://github.com/cianoc/supercollider_fragments
var freq = [72, 135, 173, 239, 267, 306, 355, 473, 512, 572, 626];
var amp = [0.25, 0.11, 0.12, 0.04, 0.1, 0.15, 0.05, 0.01, 0.03, 0.02, 0.12];
Mix.ar(SinOsc.ar(freq, 0, mul: amp * 0.1))

// random bells, let it run for a while ; https://github.com/cianoc/supercollider_fragments
var partials = 12;
var trigger = Dust.kr(3 / 7);
var f = {
    var env = EnvGen.kr(Env.perc(0, 0.2.rrand(3.0)), trigger, 1.0.rand);
    SinOsc.ar(rrand(50.0, 4000)) * env
};
Pan2.ar(Mix.ar(f.dup(partials)) / partials, 1.0.rand2)

// shimmering harmonics ; https://github.com/cianoc/supercollider_fragments
var harmonics = 16;
var f = {
    var amp = 0.max(FSinOsc.kr((1/3).rrand(1/6), 0) * 0.1.rrand(0.9));
    Pan2.ar(FSinOsc.ar(100.exprand(2000), mul: amp), 1.0.rand2)
};
f.dup(harmonics).mix / (2 * harmonics)

// decaying gongs ; https://github.com/cianoc/supercollider_fragments
{var dur = 6
;var base = Rand.ir(40, 60)
;var trig = SinOsc.ar(1/10, pi)
;var f =
 {arg detune
 ;{arg count
  ;var thisDur = dur * 0.5.rrand(1.0)
  ;var aenv = EnvGen.kr(Env.perc(0, thisDur), trig)
  ;var fenv = EnvGen.kr(Env.new([1, 1, 0, 1], [0.05 * thisDur, 0.95 * thisDur, 0]), trig)
  ;var freq = base * (count + 1 + detune.rand) * LFNoise1.kr(10, mul: 0.02 * fenv, add: 1)
  ;Pan2.ar(SinOsc.ar(freq, mul: aenv), [1, -1].choose * fenv)}}
;(Mix.fill(15, f.value(0)) + Mix.fill(15, f.value(0.1))) * 0.05}

// worth experimenting with ; https://github.com/cianoc/supercollider_fragments
var trigger = Dust.kr(3/7);
var fund = 100.rrand(400);
var f = {
    arg counter;
    var partial = counter + 1;
    var env = EnvGen.kr(Env.adsr(0, 0, 1.0, 5.0), trigger, 1 / partial);
    var amp = 0.max(LFNoise1.kr(5.0.rrand(12.0)));
    Pan2.ar(SinOsc.ar(fund * partial) * env * amp, 1.0.rand2)
};
Mix.ar(Array.fill(16, f)) * 0.5

// multiple sines ; https://github.com/cianoc/supercollider_fragments
var speeds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] / 20;
var fund = (MouseX.kr(0, 36).round(7) + 24).midicps;
var f = {
    arg count;
    Pan2.ar(FSinOsc.ar(fund * (count + 1), mul: 0.max(FSinOsc.kr(speeds.choose))), 1.0.rand2)
};
var harmonics = 16;
Mix.fill(harmonics, f) / (2 * harmonics)

// more bells ; https://github.com/cianoc/supercollider_fragments
var env = EnvGen.kr(Env.perc(0, 2), Dust.kr(1/3)) * 0.1;
var osc = SinOsc.ar({300.rrand(1200)}.dup(12), mul: env);
Mix.ar(Pan2.ar(osc, {1.rand2}.dup(12)))

// pink noise, frequencies emerge ; https://github.com/cianoc/supercollider_fragments
RLPF.ar(PinkNoise.ar(0.3), LFNoise0.kr([12, 12], 500, 500), 0.2)

// random drones ; https://github.com/cianoc/supercollider_fragments
Klank.ar(Ref.new([{exprand(60, 10000)}.dup(15)]), PinkNoise.ar(0.0025))

// bells / cylinders ; https://github.com/cianoc/supercollider_fragments
{var totalHarm = 10
;var att = 0
;var burstLength = 0.0001
;var freqSpecs = Ref.new(
 [{100.rrand(1200)}.dup(totalHarm)
 ,{0.3.rrand(1.0)}.dup(totalHarm).normalizeSum.round(0.01)
 ,{2.0.rrand(4.0)}.dup(totalHarm)])
;var burstEnv = Env.perc(0, burstLength)
;var burst = PinkNoise.ar(EnvGen.kr(burstEnv, gate: Impulse.kr(1)))
;Klank.ar(freqSpecs, burst) * MouseX.kr(0.1, 0.8)}

// bells / cylinders, variation ; https://github.com/cianoc/supercollider_fragments
{var totalHarm = 10
;var att = 0
;var burstLength = 0.0001
;var freqSpecs = Ref.new(
 [{1.rrand(30) * 100 * 0.9.rrand(1.1)}.dup(totalHarm)
 ,{0.1.rrand(0.9)}.dup(totalHarm).normalizeSum
 ,{1.0.rrand(3.0)}.dup(totalHarm)])
;var burstEnv = Env.perc(0, burstLength)
;var burst = PinkNoise.ar(EnvGen.kr(burstEnv, gate: Impulse.kr(1)))
;Klank.ar(freqSpecs, burst) * MouseX.kr(0.1, 0.8)}

// this one floats in and out ; https://github.com/cianoc/supercollider_fragments
var totalPartials = 3;
var f = {
    var base = 50.exprand(100);
    var freq = { 1.rrand(24) * base * 1.0.rrand(1.1) }.dup(totalPartials);
    var amp = Array.rand(10, 1.0, 5.0).normalizeSum;
    var res = Klank.ar(Ref.new([freq, amp]), GrayNoise.ar(0.03.rrand(0.1)));
    Pan2.ar(res * 0.max(SinOsc.kr(10 / 1.rrand(5), mul: 0.005)), LFNoise1.kr(1))
};
Mix.ar(f.dup(8)) * LFNoise1.kr(1/10).abs

// amplitude modulation ; https://github.com/cianoc/supercollider_fragments
Saw.ar(500, mul: SinOsc.ar(50, mul: 0.15))

// fm synthesis ; https://github.com/cianoc/supercollider_fragments
SinOsc.ar(400 + SinOsc.ar(124, mul: 100), mul: 0.15)

// phase modulation ; https://github.com/cianoc/supercollider_fragments
PMOsc.ar(400, 124, 1, mul: 0.15)

// phase modulation, carrier ; https://github.com/cianoc/supercollider_fragments
PMOsc.ar(LFNoise0.kr(5, 300, 700), 134, 4, mul: 0.15)

// phase modulation, modulator ; https://github.com/cianoc/supercollider_fragments
PMOsc.ar(700, LFNoise0.kr(5, 500, 700), 12, mul: 0.15)

// phase modulation, index ; https://github.com/cianoc/supercollider_fragments
PMOsc.ar(700, 567, LFNoise0.kr(5, 6, 12), mul: 0.15)

// phase modulation, all three ; https://github.com/cianoc/supercollider_fragments
var car = LFNoise0.kr([9, 9], 300, 700);
var mod = LFNoise0.kr([9, 9], 500, 700);
var ix = LFNoise0.kr([9, 9], 6, 12);
PMOsc.ar(car, mod, ix, mul: 0.15)

// ping pong ; https://github.com/cianoc/supercollider_fragments
var rate = 5;
var trig = Impulse.kr(5);
var freq = TRand.kr([36, 60], [72, 86], trig).midicps;
var ratio = 2;
var env = EnvGen.kr(Env.perc(0, 1 / rate), gate: trig);
PMOsc.ar(freq, freq * ratio, 3 + env * 4, mul: env * 0.25)

// using stepper to sequence notes and timbres ; https://github.com/cianoc/supercollider_fragments
{var rate = 5
;var trig = Impulse.kr(rate)
;var freqArray = [48, 50, 52, 53, 55, 57, 59, 60, 62, 64, 65, 67, 69, 71, 72].scramble.midicps
;var ratioArray = {1.0.rrand(3.0)}.dup(20)
;var indexArray = {1.0.rrand(4.0)}.dup(20)
;var env = EnvGen.kr(Env.perc(0, 1 / rate), gate: trig)
;var car = Select.kr(Stepper.kr(trig, freqArray.size - 1), freqArray)
;var mod = car * Select.kr(Stepper.kr(trig, ratioArray.size - 1), ratioArray)
;var ix = Select.kr(Stepper.kr(trig, indexArray.size - 1), indexArray) + env * 4
;PMOsc.ar(car, mod, ix, mul: env * 0.25)}

// using lfsaw and noise for modulation and index ; https://github.com/cianoc/supercollider_fragments
{var pitchArray = [60, 62, 64, 65, 67, 69, 71, 72].scramble.midicps.dup(2)
;var sequencer = Select.kr(Stepper.kr(Impulse.kr(3), pitchArray.size - 1), pitchArray)
;PMOsc.ar(sequencer, LFNoise1.kr(1).range(200, 800), LFSaw.kr(1).range(5, 25)) * 0.15}

// sample and hold ; https://github.com/cianoc/supercollider_fragments
var i = Latch.kr(LFSaw.kr(MouseX.kr(1.1, 30), 0, 5, 5), Impulse.kr(10));
PMOsc.ar(300, 356, i, mul: 0.1)

// envelope used also for the index ; https://github.com/cianoc/supercollider_fragments
var f = Latch.kr(Mix.ar(SinOsc.ar(#[100, 200, 300, 550], 0, mul: 100, add: 110)), Impulse.kr(7, 0));
var e = EnvGen.kr(Env.perc(0, 0.2), Impulse.kr(7, 0));
PMOsc.ar(f, f * 1.25, e * 5, 0, mul: e * 0.1)

// generating melodic runs ; https://github.com/cianoc/supercollider_fragments
SinOsc.ar(Latch.kr(LFSaw.kr(MouseX.kr(0.1, 20), 0, 500, 600), Impulse.kr(10)), mul: 0.1)

// generating melodic runs, line ; https://github.com/cianoc/supercollider_fragments
SinOsc.ar(Latch.kr(LFSaw.kr(Line.kr(0.1, 20, 60), 0, 500, 600), Impulse.kr(10)), mul: 0.1)

// karplus strong ; https://github.com/cianoc/supercollider_fragments
{var att = 0
;var dec = 0.001
;var delayDecay = 0.5
;var midiPitch = 69
;var delayTime = midiPitch.midicps.reciprocal
;var burstEnv = EnvGen.kr(Env.perc(att, dec), gate: Impulse.kr(1/delayDecay))
;var burst = PinkNoise.ar(burstEnv)
;CombL.ar(burst, delayTime, delayTime, delayDecay, add: burst)}

// risefallpad ; https://github.com/cianoc/supercollider_fragments
var freq = 440;
var gate = 1;
var osc1 = Saw.ar(freq + LFTri.kr(0.3, 0));
var osc2 = Saw.ar((freq.cpsmidi - 0.03).midicps);
var filterEnv = EnvGen.kr(Env.adsr(1, 0.7, 0.0, 0.2), gate);
var ampEnv = EnvGen.ar(Env.adsr(0.1, 0.01, 0.6, 1.5), gate);
RLPF.ar(osc1 + osc2, 3000 * filterEnv + freq, 1.5) * ampEnv
