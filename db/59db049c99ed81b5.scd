// RObxdFilter - mouse cutoff
{var x = MouseX.kr(110,110 * 16,'exponential',0.2)
;RObxdFilter.ar(PinkNoise.ar * 0.5,cutoff: x)}
