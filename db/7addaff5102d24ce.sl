/* Analogue daze (Jmcc) #3 */
let pattern = [55 63 60 63 57 65 62 65];
let f = { :octave :clockRate :pwmRate :fltRate |
	let tr = Impulse(clockRate, 0);
	let patternCps = (pattern + (12 * octave)).MidiCps;
	let sq = Sequencer(patternCps, tr);
	let pwm = SinOsc(pwmRate, Rand(0, 2 * pi)) * 0.4 + 0.5;
	let cf = SinOsc(fltRate, Rand(0, 2 * pi)) * 1400 + 2000;
	Rlpf(LfPulse(Lag(sq, 0.05), 0, pwm) * 0.1, cf, 1 / 15)
};
let a = { LfNoise0(LfNoise1(0.3) * 6000 + 8000) } ! 2 * 0.07;
let x = Decay(Impulse(2, 0), 0.15) * a;
let g = x + [f(1, 8, 0.31, 0.2), f(0, 2, 0.13, 0.11)];
CombC(g, 0.375, 0.375, 5) + g.reversed * 0.4
