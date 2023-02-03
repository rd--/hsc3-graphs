;; blip ; event control ; keywords
var f = { :e |
	EqPan2(
		in: Blip(freq: e.p.UnitCps, numharm: e.y * 10 + 1),
		pos: e.o * 2 - 1
	) * e.w * e.z * e.z
};
Voicer(numVoices: 16, voiceFunc: f).Sum
