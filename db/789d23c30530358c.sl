(* sc-140 ; 22 ; MCLD *)
var n = [
	1 1 2 3 5 8 13 21
	34 55 89 144 233 377 610 987
	1597 2584 4181 6765 10946 17711 28657 46368
	75025 121393 196418 317811 514229 832040 1346269 2178309
];
var a = DmdFor(0.1, 0, Dseq(inf, Wrap(n, 20, 55).MidiCps));
Hpf(LeakDc(LfCub([-1, a, a / 3, -2], 0).Splay, 0.995) * 9, 440).Clip2(1) / 9
