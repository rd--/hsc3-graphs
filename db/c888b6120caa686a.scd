// EnvGen ; as triangle wave oscillator
var f = MouseX.kr(110, #[220, 330], 0, 0.2);
var e = Env.new([0, 0, 1, 0, -1],  [0.25, 0.25, 0.25, 0.25], 'lin', nil, 0, 0);
EnvGen.ar(e, Impulse.ar(f, 0), 0.1, 0, 1 / f, 0)
