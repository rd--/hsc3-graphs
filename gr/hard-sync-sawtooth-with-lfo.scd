// hard sync sawtooth with lfo (jmcc) #6

"overlap-texture.scd".loadRelative;

~overlap_texture.(
{var f = (30 + 50.rand).midicps
;SyncSaw.ar([f, f + 0.2], SinOsc.kr(0.2, [0, (2 * pi).rand], 2 * f, 3 * f), 0.05)}
,sustainTime:4, transitionTime:4, overlap:4, numChannels:2, postProcess:
{arg z
;CombN.ar(z, 0.3, 0.3, 4, 1, z.reverse)})
