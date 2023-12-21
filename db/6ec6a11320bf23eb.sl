(* Synched impulses, abstracted *)
var sync = 5;
var f = { :frq :num |
	SinOsc(frq, 0) * Decay2(Impulse(num / sync, 0), 0.01, 1)
};
[f(100, 3), f(300, 7), f(500, 5), f(700, 2), f(900, 9), f(1100, 6), f(1300, 1)].Splay * 0.2
