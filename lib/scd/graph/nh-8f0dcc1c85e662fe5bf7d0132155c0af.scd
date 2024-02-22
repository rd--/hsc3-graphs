// https://gist.github.com/nhthn/8f0dcc1c85e662fe5bf7d0132155c0af (nh)
var index = MouseY.kr(1, 7000, 1, 0.2);
var freq = MouseX.kr(0.01, 40, 1, 0.2);
var divide = 1;
var cutoff = 1;
var snd = LocalIn.ar(4, 0);
snd = Latch.ar(snd, PulseDivider.ar(snd.reverse, LPF.ar(snd, 10 * cutoff) * 100000 * divide, 0));
snd = SinOsc.ar({ ExpRand(10, 100) }.dup(4) * freq + (snd * index), 0);
snd = Latch.ar(snd, PulseDivider.ar(snd.reverse, LPF.ar(snd, 10 * cutoff).cubed * 8000 * divide, 0));
snd = LPF.ar(snd, 440);
snd = Select.ar(LPF.ar(snd.reverse, 10 * cutoff) * 3, [Pulse.ar(440 * freq + (snd * index), 0.5), SinOsc.ar(100 * freq + (snd * index), 0)]);
snd = RLPF.ar(snd, 440 + (1000 * LPF.ar(LPF.ar(snd, 1), 1).clip), 0.1);
snd = Sanitize.ar(snd, 0);
4.do({
	snd = snd + SinOsc.ar(ExpRand(10, 800) * freq + LPF.ar(snd * index, 100), 0);
});
snd = Splay.ar(snd) <! LocalOut.ar(snd);
snd.clip2(1) * -5.dbamp

// https://gist.github.com/nhthn/8f0dcc1c85e662fe5bf7d0132155c0af (nh)
var freqScale = MouseY.kr(0.01, 3, 1, 0.2);
var snd = LocalIn.ar(4, 0);
var freq = 3000 * freqScale + ((LPF.ar(snd, 0.1) * 100) * [1000, 1500, 1200, 1100]);
snd = RLPF.ar(Saw.ar(LPF.ar(freq.abs, 1) * snd), 1000 * freqScale + (900 * snd), snd.abs + 0.01);
snd = Select.ar(PulseDivider.ar(BPF.ar(snd, 0.1, 0.1), 1000, 0), [
	snd,
	RLPF.ar(snd, 1000 * freqScale + (100 * LPF.ar(snd, 0.1).fold2(1)), 0.5).tanh
]);
snd = LeakDC.ar(Sanitize.ar(snd, 0).clip2(1), 0.995);
snd = [2, 3, 4, 1].collect { |index| snd[index - 1] };
LocalOut.ar(snd.clip2(1));
snd = Splay.ar(snd.keep(2), 0.5, 1, 0, true);
snd.clip2 * -5.dbamp
