// landon rose (jmcc) #8
var tring = #[3, 3, 3, 3];
var specList = [
	`[[32, 43, 54, 89].midicps, nil, tring],
	`[[10, 34, 80, 120].midicps, nil, tring],
	`[[67, 88, 90, 100].midicps, nil, tring],
	`[[14, 23, 34, 45].midicps, nil, tring],
	`[[76, 88, 99, 124].midicps, nil, tring]
];
var e = Env.sine(4, 1);
Texture.spawnRoutine({
	arg i;
	var n = PinkNoise.ar([0.001, 0.001]);
	Klank.ar(specList.wrapAt(i), n) * EnvGen.ar(e, doneAction:2)
}, nextTime: 2)

// ---- modified from a patch by Landon Rose ; jmcc #8
var m = [[32, 43, 54, 89], [10, 34, 80, 120], [67, 88, 90, 100], [14, 23, 34, 45]];
Texture.spawnRoutine({ |i
    var s = { PinkNoise.ar() * 0.001 }.dup;
    EnvGen.ar(Env.sine(4, 1), 1, 1, 0, 1, 2) * RingzBank.ar(s, m.wrapAt(i).midicps, #[1], #[3])
}, 2, 2, inf, nil, 0)
