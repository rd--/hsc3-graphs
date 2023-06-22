// https://twitter.com/n_peeq_t/status/1613573427717345282
((1 .. 99) ** 1.046).collect { | i |
	Pan2.ar(
		SinOsc.ar(99 * i, 0) * i / 99 / 9,
		SinOsc.kr(i / 50, 0)
	) * EnvGen.kr(
		Env.perc(0, SinOsc.kr(i / 9999, 0.1) * 0.1, 1, -2),
		SinOsc.kr(SinOsc.kr(i / 9999, 3) * 7, 0.5) * 0.5
	)
}.sum

//---- https://twitter.com/n_peeq_t/status/1613573427717345282
s=SinOsc;((1..99)**1.046).do({|i|{ar(Pan2,ar(s,99*i,mul:i/99)/9,kr(s,i/50))*EnvGen.kr(Env.perc(0,kr(s,i/9999,0.1,0.1),1,-2),kr(s,kr(s,i/9999,3,7),0.5,0.5))}.play})
