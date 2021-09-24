// shimmering harmonics
{var harmonics = 16
;var f =
 {arg count
 ;var amp = 0.max(FSinOsc.kr((1/3).rrand(1/6)) * 0.1.rrand(0.9))
 ;Pan2.ar(FSinOsc.ar(100.exprand(2000), mul: amp), 1.0.rand2)}
;Mix.fill(harmonics, f) / (2 * harmonics)}
