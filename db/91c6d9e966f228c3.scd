// https://scsynth.org/t/phaseshaping-osc-algorithms/3926/4 ; sp ; event control ; https://core.ac.uk/download/pdf/297014559.pdf
var voiceFunc =  {
	arg e;
	var width = e.x.clip(0.05,0.95);
	var freq = e.y * 800 + 200;
	var saw = LFSaw.ar(freq: freq / 2, iphase: 1).linlin(inMin: -1, inMax: 1, outMin: width.neg, outMax: 1 - width);
	var trig = ToggleFF.ar(trig: Trig.ar(in: saw.neg, dur: 2 / SampleRate.ir) + Trig.ar(in: saw, dur: 2 / SampleRate.ir));
	var a = saw.linlin(inMin: width.neg, inMax: 0, outMin: 0, outMax: pi).sin;
	var b = saw.linlin(inMin: 0, inMax: 1 - width, outMin: 0, outMax: 2 * pi).sin;
	Select.ar(which: trig, array: [b, a]).dup * e.w * e.z
};
Voicer.ar(numVoices: 16, voiceFunc: voiceFunc).sum * 0.2
