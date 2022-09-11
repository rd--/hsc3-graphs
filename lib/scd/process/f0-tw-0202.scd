// https://sccode.org/1-4Qy ; f0 ; 0202
inf.do({
	arg i;
	{
		var b = 0.1;
		var p = SinOsc.ar(Duty.ar(b, 0, Dseq([0, i % 9, 2, 3, 4, 0, 2, 1] * 150, 9)), 0);
		Pan2.ar(SinOsc.ar(i, p, b), i % 3 - 1, 1)
	}.play;
	(i % 5 + 1).seconds.wait
})

//----tweet0202
a=SinOsc;fork{inf.do{|i|play{Pan2.ar(a.ar(i,a.ar(Duty.ar(b=0.1,0,Dseq([0,i%9,2,3,4,0,2,1]*150,9))),b),i%3-1)};wait(i%5+1)}}
