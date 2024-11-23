/* http://sccode.org/1-4Qy (F0) ; 0349 */
let c = {
	Dseq(inf, [5 1 3 2])
};
let e = 1 / [8 4];
let f = Duty(e, 0, c() * Duty(e / 4, 0, c())) * Duty(1 / e, 0, c() * 28.8);
SinOsc(f, 0) * SinOsc(e / 9, 0)
