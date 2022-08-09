// https://sccode.org/1-4Qy ; f0 ; 0112
inf.do({
	arg i;
	{
		{
			VarSaw.ar(Duty.ar(1 / 12, 0, Dseq((12..0) * (i % 63 + 99)), doneAction: 2) * [1, 1.01], 0, i / 9 % 9 / 9) / 9
		}.play
	}.dup(2);
	(1 / 3).wait
})

//---- calculations
Ndef(\,{ SinOsc.ar(Rand.ir(200, 400), 0) * 0.1 }).play.spawn
{ { SinOsc.ar(Rand.ir(200, 400), 0) * 0.1 }.play }.dup(2)

//----tweet0112
r{inf.do{|i|Ndef(\,{VarSaw.ar(Duty.ar(1/12,0,Dseq((12..0)*(i%63+99)),2)*[1,1.01],0,i/9%9/9)/9}).play.spawn;wait(1/3)}}.play
