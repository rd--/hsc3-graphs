// string wander-cluster (jmcc) #6
Texture.overlap(
{var note = 50 + 50.rand
;var note_ = (note + 15.rand - 7).fold(50, 120)
;var delay = 1/note_.midicps
;Pan2.ar(CombC.ar(WhiteNoise.ar(0.008), 0.01, delay, delay * 1000), 1.0.rand2)}
,sustainTime:4/3, transitionTime:4/3, overlap:6)

/* with vibrato */
Texture.overlap(
{var note = 50 + 50.rand
;var note_ = (note + 15.rand - 7).fold(50, 120)
;var freq = note_.midicps
;var decayTime = 1/freq * 1000
;var freq_ = SinOsc.kr(4 + 4.0.rand, 0) * (0.01 * freq) + freq
;var delay = 1/freq_
;Pan2.ar(CombC.ar(WhiteNoise.ar(0.008), 0.01, delay, decayTime), 1.0.rand2)}
,sustainTime:4/3, transitionTime:4/3, overlap:6)
