// https://sccode.org/1-4Qy ; f0 ; 0247
{
	inf.do({
		arg i;
		var j = i.div(100) + 1;
		x = {
			Splay2.ar(Blip.ar(i * j % [99, 98, 97, 96] + 1, i * j % [98, 97, 96, 95] + 1)) * 5
		}.play(fadeTime: 6);
		0.12.wait;
		x.release(8)
	})
}.fork

//----tweet0247
r{inf.do{|i|j=i.div(100)+1;x={Splay.ar(Blip.ar(i*j%(99..96)+1,i*j%(98..95)+1))*5}.play(s,0,6);0.12.wait;x.release(8)}}.play
