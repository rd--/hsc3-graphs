// multiple sines
{var speeds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] / 20
;var fund = (MouseX.kr(0, 36).round(7) + 24).midicps
;var f =
 {arg count
 ;Pan2.ar(FSinOsc.ar(fund * (count + 1), mul: 0.max(FSinOsc.kr(speeds.choose))), 1.0.rand2)}
;var harmonics = 16
;Mix.fill(harmonics, f) / (2 * harmonics)}
