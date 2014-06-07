{var a = 0.02 /* amplitude scale */
;var f = 50 /* fundamental frequency */
;var p = 20 /* number of partials per channel */
;var l = Line.kr(0, a.neg, 60, 0) /* amplitude offset, causes sound to separate and fade */
;var o = {arg h
	     ;var r = 6 + [Rand.new(-4, 4), Rand.new(-4, 4)] /* amplitude rate */
         ;var n = LFNoise1.kr(r)
         ;var e = max(0, n * a + l) /* clip negative amplitudes to zero */
         ;FSinOsc.ar(f * (h + 1), 0) * e}
;Out.ar(0, (0..p).collect(o).sum)}.play
