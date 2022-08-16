// zizle (jmcc) #SC3d1.5
Texture.overlap({
	Pan2.ar(
		SinOsc.ar(24.rrand(108).midiCps, 2 * pi.rand)
		* Mix.ar(SinOsc.ar(0.3.exprand(8) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand]) * 0.1).max(0)
		* Mix.ar(SinOsc.ar(6.exprand(24) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand]) * 0.1).abs,
		1.0.rand2,
		1
	)
}, 4, 4, 12, 2)

// zizle (jmcc) #SC3d1.5
Texture.overlap({
	Pan2.ar(
		HPZ1.ar(
			LFTri.ar(24.rrand(128).midiCps, 2 * pi.rand)
			* Mix.ar(SinOsc.ar(0.3.exprand(8) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand]) * 0.04).max(0)
			* Mix.ar(SinOsc.ar(6.exprand(24) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand])).abs
		),
		1.0.rand2,
		1
	)
}, 4, 4, 12, 2)

// zizle (jmcc) #SC3d1.5
Texture.overlap({
	var x = Pan2.ar(
		LPZ2.ar(
			LFPulse.ar(80 * 1.rrand(32), 2 * pi.rand, 0.1)
			* Mix.ar(SinOsc.ar(0.3.exprand(8) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand]) * 0.04).max(0)
			* Mix.ar(SinOsc.ar(6.exprand(24) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand])).abs
		),
		1.0.rand2,
		1
	);
	2.timesRepeat({
		x = AllpassN.ar(x, 0.05, [0.05.rand, 0.05.rand], 3.0.rand)
	});
	x
}, 4, 4, 12, 2)

// zizle (jmcc) #SC3d1.5
Texture.overlap({
	Pan2.ar(
		BPZ2.ar(
			LFPulse.ar(120 * 100.rand, 2 * pi.rand, 0.5)
			* Mix.ar(SinOsc.ar(0.3.exprand(8) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand]) * 0.04).max(0)
			* Mix.ar(SinOsc.ar(6.exprand(24) * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand])).abs
		),
		1.0.rand2,
		1
	)
}, 4, 4, 12, 2)
