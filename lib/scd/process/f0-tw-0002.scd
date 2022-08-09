// https://sccode.org/1-4Qy ; f0 ; 0002
0.to(98).do({
	{
		var o = BPF.ar(Impulse.ar(LinRand.ir(0.5, 18.5, 0), 0), LinRand.ir(0, 9999, 0), LinRand.ir(0, 0.3, 0)) * 5;
		Release.ar(Pan2.ar(o, Rand.ir(-1, 1), 1), 0, 3, 9)
	}.play;
	3.wait;
})

//---- https://sccode.org/1-4Qy ; tweet0002
r{99.do{x={Pan2.ar(BPF.ar(Impulse.ar(18.linrand+0.5),9999.linrand,0.3.linrand,5),1.0.rand2)}.play;3.wait;x.release(9)}}.play
