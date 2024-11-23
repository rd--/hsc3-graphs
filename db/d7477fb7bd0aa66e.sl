/* http://sccode.org/1-4Qy (F0) ; 0310 */
let b = 1 / [3, 2];
let f = Duty(
	Trig(LocalIn(2, 0), SinOscFb(b, 0) + 11 / 2),
	0,
	Dseq(inf, [1 .. 8])
) * 99;
let c = SinOscFb(f, SinOscFb(b / 12, 0));
c <! LocalOut(c)
