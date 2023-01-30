;; MembraneCircle ; event control ; note limited voice count ; keywords
var f = { :e |
	var loss = LinExp(in: e.y, srclo: 0, srchi: 1, dstlo: 0.99999, dsthi: 0.99950);
	var wobble = SinOsc(freq: 2, phase: 0);
	var tension = LinExp(in: e.x, srclo: 0, srchi: 1, dstlo: 0.01, dsthi: 0.1) + (wobble * 0.0001);
	var env = Perc(trig: e.w, attackTime: 0.0001, releaseTime: 1 - e.z, curve: -4) * (e.z + (e.y / 4));
	Pan2(in: MembraneCircle(excitation: PinkNoise() * env, tension: tension, loss: loss), pos: e.o * 2 - 1, level: 1)
};
Voicer(numVoices: 6, voiceFunc: f).sum
