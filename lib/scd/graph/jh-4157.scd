// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157
{SinOsc.ar((4 ** (200.iota * 0.002)) * 300).sum * 0.02}

// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157/3
{SinOsc.ar(200.iota.lincurve(0, 199, 300, 300 * (4 ** (199 * 0.002)), -2)).sum * 0.02}

// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit) ; psuedo-doppler
{Splay.ar(SinOsc.ar((2 ** Array.series(100, 0, 0.002)) * 120)) * 0.1}

// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit) ; psuedo-doppler-formants
{Splay.ar(Saw.ar((2 ** Array.series(100, 0, 0.002)) * 120)) * 0.1}

// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit)
{var k = 100 // 200 ; c.f. 12 25 50 100 200 400 600 800
;var b = 2 // 4 ; c.f. 2, 3, 4
;var n = 0.02 // 0.002 ; c.f. 0.002 0.004 0.01 0.05 0.1 0.125
;var f0 = 180 // 300 ; c.f. 120 180 240
;var f = b ** Array.series(size: k, start: 0, step: n)
;Splay.ar(SinOsc.ar(freq: f * f0, phase: 0), spread: 1, level: 0.1, center: 0, levelComp: true)}

// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit)
var t = Impulse.ar(0.1, 0);
var sinosc = {
    arg freq;
    (Phasor.ar(t, freq * SampleDur.ir, 0, 1, 0) * 2 * pi).sin
};
var k = 160;
var b = TRand.ar(2, 2.25, t);
var n = TRand.ar(0.002, 0.02, t);
var f0 = TRand.ar(90, 180, t);
var fMul = b ** Array.series(k, 0, n);
var e = EnvGen.ar(Env.perc(1, 10, 0.1), t);
Splay.ar(sinosc.value(f0 * fMul), 1, e, 0, true)

//---- jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit)
var t = Impulse.ar(freq: 0.1, phase: 0);
var sinosc = {
    arg freq;
    (Phasor.ar(trig: t, rate: (freq * SampleDur.ir), start: 0, end: 1, resetPos: 0) * 2 * pi).sin
};
var k = 160;
var b = TRand.ar(lo: 2, hi: 2.25, trig: t);
var n = TRand.ar(lo: 0.002, hi: 0.02, trig: t);
var f0 = TRand.ar(lo: 90, hi: 180, trig: t);
var fMul = b ** Array.series(size: k, start: 0, step: n);
var e = EnvGen.ar(envelope: Env.perc(attackTime: 1, releaseTime: 10, level: 0.1), gate: t);
Splay.ar(sinosc.value(f0 * fMul), spread: 1, level: e, center: 0, levelComp: true)

//---- calculations
Array.series(size: 200, start: 0, step: 0.002) == (200.iota * 0.002)
