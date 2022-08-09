// https://sccode.org/1-4Qy ; f0 ; 0057
{
	var z = {
		#b, c, d, e, f, g, h, i = 1.to(50).scramble;
		Release.ar(GVerb.ar(GVerb.ar(GVerb.ar(GVerb.ar(Dust.ar(1), b, c), d, e), f, g), h, i) / 20, 0, 6, 5)
	}.play;
	6.wait;
}.loop

//----tweet0057
a=GVerb;fork{loop{z=play{#b,c,d,e,f,g,h,i=(1..50).scramble;a.ar(a.ar(a.ar(a.ar(Dust.ar(1),b,c),d,e),f,g),h,i)/20};6.wait;z.release(5)}}
