// RObxdFilter - mouse cutoff & resonance
{var x = MouseX.kr(110,110 * 16,'exponential',0.2)
;var y = MouseY.kr(0,1.1,'linear',0.2)
;RObxdFilter.ar(PinkNoise.ar * 0.5,cutoff: x,resonance: y)}
