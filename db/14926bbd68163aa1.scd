// cricket (rd)
{var e = Decay2.kr(Impulse.kr({Rand.new(10, 13)}.dup, 0), 0.001, 0.005)
;var f = SinOsc.kr({Rand.new(10, 13)}.dup, 0) * e * {Rand.new(4, 7)}.dup
;var r4 = {TRand.kr(2220, 2227, Impulse.kr(0.7, 0))}.dup
;SinOsc.ar(r4, 0) * f * 0.25}
