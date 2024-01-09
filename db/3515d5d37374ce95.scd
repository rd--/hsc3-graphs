// https://scsynth.org/t/phaseshaping-osc-algorithms/3926/4 ; sp ; event control ; https://core.ac.uk/download/pdf/297014559.pdf
var voiceFunc =  { | e |
	var width = e.x.clip(0.05,0.95);
	var freq = e.y * 800 + 200;
	var saw = LFSaw.ar(freq / 2, 1).linlin(
		-1, 1,
		width.neg, 1 - width
	);
	var trig = ToggleFF.ar(Trig.ar(saw.neg, 2 / SampleRate.ir) + Trig.ar(saw, 2 / SampleRate.ir));
	var a = saw.linlin(width.neg, 0, 0, pi).sin;
	var b = saw.linlin(0, 1 - width, 0, 2 * pi).sin;
	Select.ar(trig, [b, a]).dup * e.w * e.z
};
Voicer.ar(0, 16, voiceFunc).sum * 0.2
