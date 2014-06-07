~add_env = {
	arg sig_fn;
	{
		var susdur = \susdur.kr(4);
		var transdur = \transdur.kr(1);
		var env = Env([0,1,1,0],[transdur,susdur,transdur],\sin);
		Out.ar(0,sig_fn.value * EnvGen.kr(env,doneAction: 2));
	};
};

~overlap_texture = {
	arg sig_fn, susdur, transdur, overlaps, maxRepeats = inf;
	Task({
		maxRepeats.do{
			arg index;
			~add_env.(sig_fn.value).play(args:[\susdur:susdur,\transdur:transdur]);
			((susdur + (transdur * 2)) / overlaps).wait;
		};
	}).play;
};

~post_process = {
	arg treatment,bus = 0,nc = 2;
	{
		var z = In.ar(bus,nc);
		z = treatment.(z);
		ReplaceOut.ar(bus,z);
	}.play(addAction: \addToTail);
};
