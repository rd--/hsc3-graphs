;; Bezier ; event control ; requires=voicer
var voiceFunc = { :e |
	var w = { :l :r |
		LinLin(LfdNoise3(e.rx * 5), -1, 1, l, r)
	};
	{
		var p = [0, 0, w(0.05, 0.25), -1.3, w(0.25, 0.45), -1.3, 0.5, 0, w(0.55, 0.75), 1.3, w(0.75, 0.95), 1.3, 1, 0];
		var o = Bezier(100, 0.001, w(200, 205) * (e.x + 0.5), 0, p);
		EqPan2(o, e.o * 2 - 1) * e.z * LagUd(e.w, 0.01, e.y * 4)
	} !+ 4
};
Voicer(4, voiceFunc).sum
