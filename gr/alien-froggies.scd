~alien_froggies = {
	arg rate;
	{
		var r = (rate * (0.2.bilinrand.exp)).fold(1.0,30.0);
		Formant.ar(r,exprand(200,3000.0),9.0.rand * r + r,0.05);
	};
};

~add_env = {
	arg sig_fn;
	{
		var susdur = \susdur.kr(4);
		var transdur = \transdur.kr(1);
		var env = EnvGen.kr(Env([0,1,1,0],[transdur,susdur,transdur],\sin),doneAction: 2);
		Out.ar(0,sig_fn.value * env);
	};
};

~add_env.(~alien_froggies.(11)).play(args: [\susdur:0.5,\transdur:0.25]);

~overlap_texture = {
	arg sig_fn, susdur, transdur, overlaps, maxRepeats = inf;
	Task({
		maxRepeats.do{
			arg index;
			~add_env.(sig_fn.value).play(args: [\susdur:susdur,\transdur:transdur]);
			((susdur + (transdur * 2)) / overlaps).wait;
		};
	}).play;
}

~overlap_texture.({~alien_froggies.(11)},susdur:0.5,transdur:0.25,overlaps:5);
