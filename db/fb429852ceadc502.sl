(* https://sccode.org/1-4Qy ; f0 ; 0360 *)
var t = SinOsc([7.992, 8], 0);
var e = Perc(t, 0.005, 0.2, -4);
var f = [1, 2].collect { :i |
	var q = [
		Dseq(240, '@BGIJB@IGBJI'.ascii.asArray),
		Dseq(120, '@LEGJLEG'.ascii.asArray),
		Dseq(60, 'EGJL'.ascii.asArray)
	];
	Demand(t[i], 0, Dseq(1, q)).MidiCps
};
var x = SinOsc(f, SinOsc(1 / [12, 9], 0) / 4 + 1 * SinOsc(f, e * pi)) * e / 2;
FreeVerb2(x[1], x[2], 0.1, 1, 0)