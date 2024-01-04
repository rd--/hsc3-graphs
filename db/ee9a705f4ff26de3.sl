(* https://sccode.org/1-4Qy ; f0 ; 0349 *)
var c = {
	Dseq(inf, [5 1 3 2])
};
var e = 1 / [8 4];
var f = Duty(e, 0, c() * Duty(e / 4, 0, c())) * Duty(1 / e, 0, c() * 28.8);
SinOsc(f, 0) * SinOsc(e / 9, 0)
