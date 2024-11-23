/* IXA ; https://nathan.ho.name/posts/ixa-synthesis/ */
let ixa = { :freq :in :index |
	let phase = Phasor(Impulse(0, 0), freq / SampleRate(), 0, 1, 0);
	let w1 = (phase % 0.5 * 2.pi).Sin * (2 * (phase % 0.5 < 0.25) - 1);
	let w2 = w1 + (2 * (phase % 0.5 >= 0.25));
	let w3 = w2 + (2 * (phase >= 0.5));
	(w3 + (in * index)).Fold2(1)
};
let freq = 100;
ixa(freq, SinOsc(freq, 0), Line(0, 10, 3)) * 0.5 # 2
