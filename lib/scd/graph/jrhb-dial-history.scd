// dial history (jrhb)
{ var mfv = [[697, 770, 852, 941], [1209, 1336, 1477, 1633]]
; var numbers = [[3, 1]] ++ {var x = [0,1,2]; x.collect({arg y; x.collect({arg z; [y,z]})})}.value.flatten
; var n = Dwhite.new(7, 12, inf)
; var w = Dwhite.new(2, 7, 1)
; var b = Dbrown.new(0.1, 0.2, 0.01, n)
; var rate = Dseq.new([w, b], inf)
; var q = Dseq.new(10.iota(1), inf)
; var trig = Trig.kr(TDuty.kr(rate, 0, q), 0.09)
; var pat = Latch.kr(trig, trig)
; var x = MouseX.kr(0, 1, 'linear', 0.2)
; var h = Hasher.kr(pat * x)
; var which = h.range(0, numbers.size).trunc.value(1)
; var both = Select.kr(which, numbers)
; var dial = Select.kr(both, mfv.flop)
; var sig = SinOsc.ar(dial, 0) * 0.05 * trig
; var d = LFDNoise3.kr(0.5)
; var dsig = DelayC.ar(sig, 0.2, d.range(0, 0.01))
; var g1 = GrayNoise.ar
; var g2 = GrayNoise.ar
; var z = Silent.ar(1)
; var hiss = g1 * 0.01 + HPF.ar(g2 * 0.02, 3000)
; [z, dsig + hiss] }

//---- calculations (stsc3 doesn't parse list comprehensions or enumeration ranges)
{: [a, b], a <- [0,1,2], b <- [0,1,2] }.all
{var x = [0,1,2]; x.collect({arg y; x.collect({arg z; [y,z]})})}.value.flatten
10.iota + 1 == 1.series(nil,10)
