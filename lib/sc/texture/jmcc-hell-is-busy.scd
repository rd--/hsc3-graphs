// hell is busy (jmcc) #1
RTexture.overlap(
{var e = LFPulse.kr(1 + 10.0.rand, 0, 0.7.rand, 0.04) /* amplitude envelope */
;Pan2.ar(FSinOsc.ar(400 + 2000.0.rand, 0, e), 1.0.rand2)}
,sustainTime:4, transitionTime:4, overlap:8) /* overlap = number of simultaneous events */
