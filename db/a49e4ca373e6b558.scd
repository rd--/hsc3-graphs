// MiClouds
{var imp = Dust.ar([0.8,1.1]);
 var freq = Latch.ar(PinkNoise.ar(24,80), imp).midicps;
 var input = RLPF.ar(imp, freq, 0.002, 4);
 var pit = LFNoise1.kr(0.3,12);
 var pos = LFNoise2.kr(0.4,0.5,0.5);
 var size = LFNoise1.kr(0.3,0.5,0.5);
 var dens = LFNoise1.kr(0.3,0.5,0.5);
 var tex = LFNoise1.kr(0.3,0.5,0.5);
 var frez = LFClipNoise.kr(0.3);
 MiClouds.ar(input, pit, pos, size, dens, tex, drywet: 0.5, in_gain: 2, rvb:0.3, fb: 0.8, freeze: frez, lofi: 1, mode: 0)}
