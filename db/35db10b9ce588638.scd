// noise burst sweep (jmcc) #6
{var n = WhiteNoise.ar ! 2
;var lfoRate = MouseX.kr(10,60,'exponential',0.2)
;var amp = max(0,LFSaw.kr(lfoRate,-1))
;var cfreq = MouseY.kr(400,8000,'exponential',0.2)
;var freq = SinOsc.kr(0.2,0) * cfreq + (1.05 * cfreq)
;Resonz.ar(n * amp,freq,0.1)}
