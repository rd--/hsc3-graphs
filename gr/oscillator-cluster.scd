{var ln = {arg a,b,d;Line.kr(a,b,d,1)}
;var xln = {arg a,b,d;XLine.kr(a,b,d,1)}
;var rln = {arg r,a,b,d
           ;var n = Rand.new(0,r)
           ;ln.value(a + n,b,d)}
;var rxln = {arg r,a,b,d
            ;var n = Rand.new(0,r)
            ;xln.value(a + n,b,d)}
;var prt = {arg d,a
           ;{arg cf
            ;var r1 = Rand.new(cf,cf + 2)
            ;var r2 = rln.value(1,5,0.01,d)
            ;var r3 = rln.value(10,20,0,d)
            ;var r4 = Rand.new(0.1,0.2)
            ;var f = [cf,r1] + (SinOsc.kr(r2,0) * r3)
            ;var o = FSinOsc.ar(f,0)
            ;var e = Decay2.ar(Impulse.ar(0,0),r4,d) * a
            ;o * e}}
;var np = 12
;var fp = Array.fill(np,{Rand.new(220,660)})
;var d = Rand.new(4,7)
;var a = Rand.new(0.01,0.05)
;Out.ar(0,fp.collect(prt.value(d,a)).sum)}.play