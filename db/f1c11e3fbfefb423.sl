/* F0 ; <http://twitter.com/redFrik/status/1395519538008141835> */
let c = Duty(0.004, 0, Dseries(inf, 1, [1, 2]) % Duty(8.192, 0, Dseq(1, 1:6 * 75)));
let d = Hpf(MantissaMask(c, 3),5);
let f = { :x |
	SinOscFb(x, 0).Max(0)
};
let p = [250, 200] * Lag(Duty(4.096, 0, Dseq(1, [4 6 5 5 5 5 3] / 4)), 0.1);
let o = SinOscFb(p, f(0.08)) * f(1 / [99, 60]) / 3;
Lpf((d.Sin + (SinOscFb(63, f(0.8)) * d) / 9 + o).Tanh / 2, 10000) * 0.2
