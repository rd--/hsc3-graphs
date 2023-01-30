;; Blip ; requires=voicer (event control)
var f = { :e |
	var o = Blip((e.x * 13 + 48).MidiCps, e.y * 19 + 1);
	EqPan2(o, e.o * 2 - 1) * e.z * e.w * 0.5
};
Voicer(16, f).sum
