// https://sccode.org/1-4Qy ; f0 ; 0205
var a = [1, 3, 5, 7, 9] * 99;
{
	a = (a * 9).wrap(99, 8000);
	{
		Release.ar(SinOsc.ar(Duty.ar(1 / [8, 9], 0, Dseq.dr(a, 99)), 0) * 0.2, 0, 0, 9)
	}.play;
	2.seconds.wait
}.loop

//----tweet0205
a=(1,3..9)*99;fork{inf.do{play{SinOsc.ar(Duty.ar(1/[8,9],0,Dseq(a=wrap(a*9,99,8e3),99)),0,Line.kr(0.2,0,9,1,0,2))};2.wait}}
