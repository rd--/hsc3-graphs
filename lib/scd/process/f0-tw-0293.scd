// https://sccode.org/1-4Qy ; f0 ; 0293
{
	var f = {
		arg a;
		var d;
		{
			var i = a[0];
			var b = Saw.kr(i);
			d = 1 / i;
			Pan2.ar(SinOscFB.ar(Duty.kr(d, 0, Dseq(a * 99 / 2), 2), b) / 5, b)
		}.play;
		2.wait;
		f.value(a + 3 / d % 9)
	};
	f.value(4.to(12))
}.fork

//--tweet0293
fork{(f={|a|play{Pan2.ar(SinOscFB.ar(Duty.kr(d=1/i=a@0,0,Dseq(a*99/2),2),b=Saw.kr(i))/5,b)};2.wait;f.(a+3/d%9)}).((4..12))}
