// harmonic tumbling (jmcc) #1

{var f = 80
;var p = 10
;var t = XLine.kr([10,11],0.1,60,doneAction: 0) /* trigger probability decreases over time */
;var o = {arg h
         ;var n = Dust.kr(t)
         ;var r = Rand.new(0,0.5)
         ;var e = Decay2.kr(n * 0.02,0.005,r)
         ;FSinOsc.ar(f * (h + 1),0) * e}
;Out.ar(0,(0..p).collect(o).sum)}.play
