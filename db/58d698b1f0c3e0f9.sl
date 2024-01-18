{- https://scsynth.org/t/phaseshaping-osc-algorithms/3926/4 ; sp ; event control ; https://core.ac.uk/download/pdf/297014559.pdf -}
Voicer(1, 16) { :e |
	let width = Clip(e.x, 0.05, 0.95);
	let freq = e.y * 800 + 200;
	let saw = LinLin(LfSaw(freq / 2, 1), -1, 1, width.Neg, 1 - width);
	let trig = ToggleFf(Trig(saw.Neg, 2 / SampleRate()) + Trig(saw, 2 / SampleRate()));
	let a = LinLin(saw, width.Neg, 0, 0, pi).Sin;
	let b = LinLin(saw, 0, 1 - width, 0, 2 * pi).Sin;
	Select2(trig, a, b).EqPan2(0) * e.w * e.z
}.Mix * 0.2
