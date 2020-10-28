// reverberated noise bursts (jmcc) #3
{var s = Decay.ar(Dust.ar(0.6, 0.2), 0.15, PinkNoise.ar) /* pink noise percussion sound */
;var z = DelayN.ar(s, 0.048, 0.048) /* reverb predelay time */
;var y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(6,{0.1.rand}), 0.04, 0.05), 15)) /* 6 modulated comb delays in parallel */
;4.do({y = AllpassN.ar(y, 0.050, [0.050.rand, 0.050.rand], 1)}) /* chain of 4 allpass delays on each of two channels (8 total) */
;s + y}.play /* add original sound to reverb */

