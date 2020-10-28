// reso-pulse (jmcc) #1
Texture.overlap(
{var f = #[25, 30, 34, 37, 41, 42, 46, 49, 53, 54, 58, 61, 63, 66].choose.midicps
;LFPulse.ar(f, 0, 0.2, 1, LFPulse.ar(2 * f + 0.5.rand2, 0, 0.2, 1)) * 0.02}
,sustainTime:4, transitionTime:2, overlap:4, numChannels:1, postProcess:
{arg z
;var lfoFreq = 6
;var lfo = LFNoise0.kr(lfoFreq, 1000, 1200) /* cutoff frequency */
;var x = MouseX.kr(0.2, 0.02, 'exponential') /* filter bandwidth */
;var left = RLPF.ar(z, lfo, x)
;var delayTime = 2 / lfoFreq
;var right = DelayN.ar(left, delayTime, delayTime) /* delay right channel by two beats */
;[left,right]})
