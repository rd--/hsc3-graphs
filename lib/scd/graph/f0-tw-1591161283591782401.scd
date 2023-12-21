// ---- https://twitter.com/redFrik/status/1591161283591782401
var x = {
	var d = 1 / 12;
	var b = (1 .. 8) / 4;
	var l = LFTri.kr(d, b) / 8;
	var y = VarSaw.ar(({ [0, 2, 5, 7, 9].choose + [36, 48].choose } ! 4 + l).midiCps, 0, l + 0.4);
	var z = RLPF.ar(y, 8 ** LFTri.kr(d * b, 0) * 999, 1);
	Splay2.ar(AllpassC.ar(AllpassC.ar(z, 1, LFTri.ar([6, 4, 6] / 4, [0, 1]) + 1 / 2, 1), 1, 1 / 2, 4) * d)
};
{
	{
		x.release(24);
		x.play(s, 0, 9);
		(9.rand / 8 + 33.rand + 8).wait
	}.loop
}.r.play

// https://twitter.com/redFrik/status/1591161283591782401
r{loop{x.release(24);play(x={ar(Splay,ar(a=AllpassC,ar(a,ar(RLPF,ar(VarSaw,midicps({[0,2,5,7,9].choose+[36,48].choose}!4+l=kr(c=LFTri,d=1/12,b=(1..8)/4)/8),0,l+0.4),8**kr(c,d*b)*999),1,ar(c,[6,4,6]/4,[0,1])+1/2),1,1/2,4,d))},s,0,9);wait(9.rand/8+33.rand+8)}}.play
