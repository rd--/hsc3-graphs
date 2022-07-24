// https://gist.github.com/nhthn/8f0dcc1c85e662fe5bf7d0132155c0af (nh)
var freqScale = MouseY.kr(0.01, 3, 1, 0.2);
var snd = LocalIn.ar(4, 0);
var freq = 3000 * freqScale + ((LPF.ar(snd, 0.1) * 100) * #[1000, 1500, 1200, 1100]);
snd = RLPF.ar(Saw.ar(LPF.ar(freq.abs, 1) * snd), 1000 * freqScale + (900 * snd), snd.abs + 0.01);
snd = Select.ar(PulseDivider.ar(BPF.ar(snd, 0.1, 0.1), 1000, 0), [
	snd,
	RLPF.ar(snd, 1000 * freqScale + (100 * LPF.ar(snd, 0.1).fold2(1)), 0.5).tanh
]);
snd = LeakDC.ar(Sanitize.ar(snd, 0).clip2(1), 0.995);
snd = #[2, 3, 4, 1].collect({ arg index; snd.nth(index) });
LocalOut.ar(snd.clip2(1));
snd = Splay.ar(snd.keep(2), 0.5, 1, 0, true);
snd.clip2 * -5.dbamp
