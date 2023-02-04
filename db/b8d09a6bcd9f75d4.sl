;; Seq ; rather than Mce expansion at tr, it can be clearer to view tr as a functor
var m = { :f |
	var tr = Impulse(f, 0);
	var sq = Dseq(inf, [60, 63, 67, 69]);
	Demand(tr, 0, sq).MidiCps
};
SinOsc([2, 3, 5].collect(m), 0).Splay2 * 0.1
