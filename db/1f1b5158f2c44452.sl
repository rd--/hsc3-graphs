/* Env ; circle */
let env = Env([6000 700 100], [1 1], ['exp' 'lin'], nil, nil, 0).circle(1, 'lin');
SinOsc(
	env.asEnvGen(MouseX(-1, 1, 0, 0.2)),
	0
) * 0.1 + Impulse(1, 0)
