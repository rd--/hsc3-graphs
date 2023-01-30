;; theremin (jmcc) ; event control
Voicer(16, { :e |
	var freq = Lag(LinExp(e.y, 0, 1, 4000, 200), 0.8);
	var a = SinOsc(freq + (freq * SinOsc(4 + 3 * e.rx, 0) * 0.02), 0) * e.x * 0.6 * Lag(e.w, 0.2);
	Pan2(a, e.o * 0.25, 0.5 + e.z)
}).sum * 0.5
