// noise modulated sines (jmcc) #6
RTexture.overlap(
{var f = (60 + 40.rand).midicps
;FSinOsc.ar([f, f + 0.2], 0) * LFNoise2.kr(f * [0.15, 0.16], 0.1)}
,4, 4, 4
,postProcess: {arg z; CombN.ar(z, 0.3, 0.3, 4, 1, z.reverse)})
