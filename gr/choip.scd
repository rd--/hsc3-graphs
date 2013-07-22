~choip = {
	arg t = 12;
	{
		var i = Impulse.ar(XLine.kr(exprand(1,30),exprand(1,30),t));
		var f = XLine.kr(exprand(600.0,8000.0),exprand(600.0,8000.0),t);
		var a = SinOsc.ar(Decay2.ar(i,0.05,0.5,-0.9*f,f));
		var l = Line.kr(1.0.rand2,1.0.rand2,t);
		var j = XLine.kr(exprand(0.01,0.5),exprand(0.01,0.5),t);
		Pan2.ar(Decay2.ar(i * j,0.01,0.2,a),l);
	};
}

~choip.(12).play;

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({~choip.(12)},susdur:1,transdur:12-2,overlaps:8);

~choip_pp = {
	arg n = 4;
	{
		var z = In.ar(0,2);
		n.do({ z = AllpassN.ar(z, 0.1, [0.05.rand,0.05.rand], 4)});
		ReplaceOut.ar(0,z);
	};
}

~choip_pp.(4).play(addAction: \addToTail);
