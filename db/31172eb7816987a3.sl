(* Seq ; rather than Mce expansion at tr, it can be clearer to view tr as a functor *)
var freq = [2 3 5].collect { :trFreq |
	var tr = Impulse(trFreq, 0);
	var sq = Dseq(inf, [60 63 67 69]);
	Demand(tr, 0, sq).MidiCps
};
SinOsc(freq, 0).Splay * 0.1
