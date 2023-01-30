;; pluck ; event control ; keywords
var f = { :e |
	var n = WhiteNoise() * e.z * 2;
	var dlMax = 1 / 220;
	var dl = dlMax * (1 - e.x * 0.9);
	Pan2(in: Pluck(in: n, trig: e.w, maxdelaytime: dlMax, delaytime: dl, decaytime: 10, coef: e.y / 3), pos: e.o * 2 - 1, level: 1)
};
Voicer(numVoices: 16, voiceFunc: f).sum
