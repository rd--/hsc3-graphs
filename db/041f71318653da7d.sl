/* http://www.fredrikolofsson.com/f0blog/?q=node/619 ; texture */
{ : tr |
	let ch = { :aList |
		Choose(tr, aList)
	};
	let freq = [100 300 400].ch;
	let amp = 0.1;
	let fb = [1 2 3].ch;
	let del = [0.01 0.02 0.1 0.5].ch;
	let lfo = [1 15 100 200].ch;
	let rate = [0.01 2].ch;
	let cutoff = [100 500].ch;
	let env = Perc(tr, 1, 4, -4);
	let lin = DelayN(Hpf(LocalIn(1, [0]), cutoff), 1, del);
	let src = SinOsc(freq + (SinOsc(rate, 0) * lfo), lin * 2.pi * fb) * amp * env;
	EqPan2(src <! LocalOut(src), 0)
}.OverlapTexture(5, 0, 3).Mix
