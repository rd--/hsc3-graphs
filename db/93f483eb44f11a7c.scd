// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit)
{var t = Impulse.ar(freq: 0.1, phase: 0)
;var sinosc = {arg freq; (Phasor.ar(trig: t, rate: (freq * SampleDur.ir), start: 0, end: 1, resetPos: 0) * 2 * pi).sin}
;var k = 160
;var b = TRand.ar(lo: 2, hi: 2.25, trig: t)
;var n = TRand.ar(lo: 0.002, hi: 0.02, trig: t)
;var f0 = TRand.ar(lo: 90, hi: 180, trig: t)
;var fMul = b ** Array.series(size: k, start: 0, step: n)
;var e = EnvGen.ar(envelope: Env.perc(attackTime: 1, releaseTime: 10, level: 0.1), gate: t)
;Splay.ar(sinosc.value(f0 * fMul), spread: 1, level: e, center: 0, levelComp: true)}
