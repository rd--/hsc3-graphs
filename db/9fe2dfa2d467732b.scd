// http://earslap.com/article/sctweeting.html
AllpassC.ar(SinOsc.ar(55, 0).tanh, 0.4, TExpRand.ar(0.0002, 0.4, Impulse.ar(8, 0)).round([0.002,0.0004]), 2)
