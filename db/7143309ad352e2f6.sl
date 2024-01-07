(* PenAngle ; range is (0, 1) ; boundary sine tones give reference points *)
let referenceTones = SinOsc([220, 440], 0) * 0.025;
(1 .. 16).collect { :vc |
	SinOsc(PenAngle(vc) * 220 + 220, 0) * PenDown(vc) * 0.1
}.Splay2 + referenceTones
