;; EnvGen ; https://scsynth.org/t/6348/3
var ln = [
	[75, 27, 3.0],
	[66, 26, 3.5],
	[50, 21, 3.0],
	[90, 21, 4.0]
];
var trig = Impulse(1 / [4, 5], 0);
var pairs = DmdFor(trig, 0.0, Choose(inf, ln));
var env = Env([pairs.first, pairs.first, pairs.second], [0, pairs.third], [-4], nil, nil, 0).asEnvGen(trig);
SinOsc(env.kr * 2, 0) * 0.25
