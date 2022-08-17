// http://earslap.com/weblog/music-release-laconicism.html
AllpassL.ar(SinOsc.ar(55,0).tanh, 0.4, TExpRand.ar(0.0002, 0.4, Impulse.ar(8, 0)).roundTo([0.002, 0.004]), 2)
