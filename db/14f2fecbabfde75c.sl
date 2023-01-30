;; tremulate (jmcc) ;  event control ; requires=voicer
var voiceFunc = { :e |
	var s = SinOsc(e.x * 400 + 500 * [1.0, 1.2, 1.5, 1.8], 0); (* just minor seventh chord *)
	var a = LfNoise2({ Rand(30, 90) } ! 4 * (0.75 + e.rx)).Max(0) * e.z;
	Pan2(s, { Rand(-1, 1) } ! 4 + (e.o * 2 - 1), a * LagUd(e.w, 0, e.ry * 2)).sum
};
CombN(Voicer(16, voiceFunc).sum * 0.5, 0.1, 0.1, 1)
