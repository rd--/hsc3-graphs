// https://www.listarc.bham.ac.uk/lists/sc-users/msg69994.html (bk)
{var voiceFunc =
 {arg e
 ;var freq1 = (e.x * 36 + 24).midicps
 ;var freq2 = TRand.kr(lo: 50, hi: 55, trig: e.w)
 ;var freq3 = TRand.kr(lo: 40, hi: 45, trig: e.w)
 ;var zMul = 4
 ;var ampEnv = EnvGen.ar(Env.new([0, 0, Latch.kr(in: e.z, trig: e.w) * zMul, 0], [0, 0.05 * e.y + 0.01, e.y], [1, -12, -12], 2), e.w)
 ;var freqSweep = EnvGen.ar(Env.new([freq1, freq1, freq2, freq3], [0, e.y, e.y * 2], [-1,-1,-1], 2), e.w)
 ;var sig = SinOsc.ar(0, Sweep.ar(e.w, freqSweep) % 1 * 2 * pi)
 ;Pan2.ar(sig * ampEnv, e.o * 2 - 1, 1)}
;Mix.ar(Voicer.ar(numVoices: 16, voiceFunc: voiceFunc))}
