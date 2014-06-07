~add_env = {
	arg sig_fn;
	{
		var susdur = \susdur.kr(4);
		var transdur = \transdur.kr(1);
		var env = Env([0,1,1,0],[transdur,susdur,transdur],\sin);
		Out.ar(0,sig_fn.value * EnvGen.kr(env,doneAction: 2));
	};
};

~spawn = {
	arg sig_fn, next_time, maxRepeats = inf;
	Task({
		maxRepeats.do{
			{Out.ar(0,sig_fn.value)}.play;
			next_time.wait;
		};
	}).play;
};

~overlap_texture = {
	arg sig_fn, susdur, transdur, overlaps, maxRepeats = inf;
	Task({
		maxRepeats.do{
			~add_env.(sig_fn).play(args:[\susdur:susdur,\transdur:transdur]);
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
