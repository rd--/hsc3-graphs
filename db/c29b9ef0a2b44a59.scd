// MiRings ; 2-op_FM ; 'pos' controls feedback (no fb at 0.5)
var input = Impulse.kr(6);
var pitch = Latch.kr(WhiteNoise.kr(), input).range(24, 48).round;
var brightness = LFNoise1.kr(0.5).range(0.2,0.9);
var position = LFNoise1.kr(0.4).range(0,0.5);
var out = MiRings.ar(input, pit: pitch, bright: brightness, pos: position, damp: 0.97, model: 3);
Splay.ar(out, LFNoise2.kr(0.5).range(-0.5,0.5)) * 0.25
