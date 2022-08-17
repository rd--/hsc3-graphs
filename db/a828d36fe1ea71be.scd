// MiVerb ; reverb time (> 1)
var freq = LFNoise0.kr(0.3).range(400, 2500);
var input = RLPF.ar(Impulse.ar(0.3), freq, 0.1);
var time = LFNoise2.kr(0.3, 0.1, 1.03);   // modulate rev time above and below 1.0!
var damp = LFNoise2.kr(0.2).range(0, 0.7);
MiVerb.ar(input, time, 0.9, damp, 0.1, mul: 0.5)
