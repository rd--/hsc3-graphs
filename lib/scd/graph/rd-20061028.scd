// xy interference
var x = MouseX.kr(20, 22000, 0, #[0.005, 0.025]);
var y = MouseY.kr(20, 22000, 0, #[0.005, 0.075]);
var nd = {
	var n = LFNoise0.kr(#[5, 9]);
	var a = SinOsc.ar(x + n, 0);
	var b = SinOsc.ar(y, 0);
	a * b
};
nd.dup(3).sum

// ---- xy interference ; keyword
var x = MouseX.kr(minval: 20, maxval: 22000, warp: 'linear', lag: #[0.005, 0.025]);
var y = MouseY.kr(minval: 20, maxval: 22000, warp: 'linear', lag: #[0.005, 0.075]);
var nd = {
	var n = LFNoise0.kr(freq: #[5, 9]);
	var a = SinOsc.ar(freq: x + n, phase: 0);
	var b = SinOsc.ar(freq: y, phase: 0);
	a * b
};
Mix.fill(n: 3, function: nd)
