// https://sccode.org/1-4Qy ; f0 ; 0021
(0 .. 255).do({
	arg j;
	{
		var f = {
			arg i;
			(j + 1 * i).asBinaryDigits
		};
		var o = Duty.ar(1 / 50, 0, Dseq.dr(f.dup(8).flat, 4), doneAction: 2);
		Pan2.ar(Decay.ar(o, j + 1 * 0.008).sin, 0, 0.5)
	}.play;
	5.12.seconds.wait
})

//----tweet0021
r{{|j|a=play{sin(Decay.ar(Duty.ar(1/50,0,Dseq(flat({|i|asBinaryDigits(j+1*i)}!8),4),2),j+1*0.008))/2!2};5.12.wait}!256}.play
