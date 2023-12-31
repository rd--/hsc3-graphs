(* http://www.fredrikolofsson.com/f0blog/?q=node/619 ; texture *)
{ : tr |
	var ch = { :anArray |
		Choose(tr, anArray)
	};
	var freq = [100 300 400].ch;
	var amp = 0.1;
	var fb = [1 2 3].ch;
	var del = [0.01 0.02 0.1 0.5].ch;
	var lfo = [1 15 100 200].ch;
	var rate = [0.01 2].ch;
	var cutoff = [100 500].ch;
	var env = Perc(tr, 1, 4, -4);
	var lin = DelayN(Hpf(LocalIn(1, [0]), cutoff), 1, del);
	var src = SinOsc(freq + (SinOsc(rate, 0) * lfo), lin * 2.pi * fb) * amp * env;
	EqPan2(src <! LocalOut(src), 0)
}.OverlapTexture(5, 0, 3).Mix
