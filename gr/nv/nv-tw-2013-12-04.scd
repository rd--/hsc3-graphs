// <https://twitter.com/headcube/status/408145586970324992> (nv)

{var f =
 {arg j
 ;var i = j + 1
 ;var a = Saw.ar((1 / i + 1) / 6)
 ;var p = Pluck.ar(a, a, 1, 1 / i / (3 - LFPulse.ar(1 / i)) / 30, 9, 0.9 / i)
 ;var x = (0.5 ** i) * p
 ;var o = SinOsc.ar(2) + [4,9]
;CombC.ar(x, 1, o * 0.001, 0) - x}
;mean(f ! 9) / 9}.play
