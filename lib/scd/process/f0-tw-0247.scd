// https://sccode.org/1-4Qy ; f0 ; 0247
inf.do({
	arg i;
	var j = i.div(100) + 1;
	{
		Release.ar(Splay2.ar(Blip.ar(i * j % [99, 98, 97, 96] + 1, i * j % [98, 97, 96, 95] + 1)) * 0.05, 0.12, 0, 8)
	}.play;
	0.12.seconds.wait
})

//----tweet0247
r{inf.do{|i|j=i.div(100)+1;x={Splay.ar(Blip.ar(i*j%(99..96)+1,i*j%(98..95)+1))*5}.play(s,0,6);0.12.wait;x.release(8)}}.play
