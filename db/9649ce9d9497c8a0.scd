// noise modulated sines (jmcc) #6 ; graph rewrite
{var z = RTexture.overlapGraph(
{arg tr
;var f = TRand.kr(60,100,tr).midicps
;FSinOsc.ar([f, f + 0.2], 0) * LFNoise2.kr(f * [0.15, 0.16], 0.1)}, 4, 4, 4)
;CombN.ar(z, 0.3, 0.3, 4, 1, z.reverse)}