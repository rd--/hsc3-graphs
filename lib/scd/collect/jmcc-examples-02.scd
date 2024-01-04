// pulsing bottles ; jmcc
var n = 6; // number of 'bottles'
Mix.arFill(n, {
        Pan2.ar(
		Resonz.ar(
			WhiteNoise.ar(
				LFPulse.kr(4 + 10.0.rand, 0, 0.7.rand, 0.8/n)
			),
			400 + 7000.0.linrand,
			0.01
		),
		SinOsc.kr(0.1 + 0.4.rand, 2pi.rand)
        )
})

// what was I thinking? ; jmcc
var z = RLPF.ar(
	Pulse.ar(
		max(SinOsc.kr(4, 0, 1, 80),
			Decay.ar(LFPulse.ar(0.1, 0, 0.05, Impulse.ar(8, 500)), 2)
		),
		LFNoise1.kr(0.157, 0.4, 0.5),
		0.04),
	LFNoise1.kr(0.2, 2000, 2400),
	0.2);
var y = z * 0.6;
z +  [
	CombL.ar(y, 0.06, LFNoise1.kr(0.3.rand, 0.025, 0.035), 1)
	+ CombL.ar(y, 0.06, LFNoise1.kr(0.3.rand, 0.025, 0.035), 1)
	,
	CombL.ar(y, 0.06, LFNoise1.kr(0.3.rand, 0.025, 0.035), 1)
	+ CombL.ar(y, 0.06, LFNoise1.kr(0.3.rand, 0.025, 0.035), 1)
]

// police state ; jmcc
var n = 4; // number of sirens
CombL.ar(
	Mix.fill(n, {
		Pan2.ar(
			SinOsc.ar(
				SinOsc.kr(0.1.rand + 0.02, 2pi.rand, 600.rand, 1000 + 300.rand2),
				0,
				LFNoise2.ar(100 + 20.0.rand2, 0.1)
			),
			1.0.rand2
		)
	})
	+ LFNoise2.ar(LFNoise2.kr([0.4,0.4], 90, 620), LFNoise2.kr([0.3,0.3], 0.15, 0.18)),
	0.3, 0.3, 3)

// ---- Rocks on rails ; Jmcc
var p = 20; // number of partials
var n = 4; // number of overlapping events
Texture.overlapRoutine({
	Pan2.ar(
		Klank.ar( // p resonant modes
			`[ // filter bank specification array:
				Array.fill(p, { 200 + 3000.0.linrand }), // resonant frequencies
				nil, // amplitudes default to 1.0
				Array.fill(p, { 0.2 + 1.0.rand }) // ring times
			],
			Resonz.ar(
				Dust.ar(100, 0.04),  // excitation
				XLine.kr(3000,300,8), // sweep filter down
				0.2  // band width ratio
			)
		),
		Line.kr(1.0.rand2, 1.0.rand2, 8) // sweep pan
	)
}, 2, 3, n, 2)

// ---- bouncing lightbulbs, pencils, cans, and other assorted objects ; jmcc
var e = Env.new([1, 1, 0],[3, 0.001]); // 3 second cut off envelope to end sound
Texture.spawnRoutine({
	Pan2.ar(
		Klank.ar( // resonant filter bank simulates resonant modes of bouncing objects
			`[
				Array.fill(4, { 400 + 8000.0.rand }), // resonant freqs
				Array.fill(4, { 1.0.rand }), // amplitudes
				Array.fill(4, { 0.01 + 0.1.rand })  // ring times
			],
			Decay.ar( // decays excite filter bank, each impulse triggers a decay
				Impulse.ar( // impulses trigger decay envelope
					XLine.kr(5 + 2.0.rand2, 600, 4), 0, // accellerating frequency
					XLine.kr(0.09, 0.000009, 4) // decaying impulse amplitude
				),
				0.001 // decay time - very short
			)
		),
		1.0.rand2 // place each bouncer at a random position in the stereo field
	)
	* // multiply by an envelope is necessary to make the sound end
	EnvGen.kr(e,doneAction:2)
}, 2, { 0.6 + 0.6.rand })

// --- Klang - Lots-o-sines ; jmcc
var n = 60; // n sines in each channel (twice as many during cross-fade)
Texture.xfadeRoutine({
	var z = [`[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil],
		`[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil]
	];
	Klang.ar(z, 1, 0) * 0.1/n;
}, 4, 4, 2)

// ---- clustered sines ; jmcc
var n = 80;
Texture.xfadeRoutine({
	var f1 = 100 + 1000.0.rand;
	var f2 = 4.0 * f1;
	var z = Array.fill(2, {
		var y = Array.fill(n, { f1 + f2.rand} );
		`[ // sine oscil bank specification :
			y, // frequencies
			f1 / y, // amplitudes
			nil // phases default to zero
		]
	});
	Klang.ar(z, 1, 0) * (0.3/n);
}, 4, 4, 2)

// ---- Klank - bank of resonators excited by impulses ; jmcc
var n = 5; // number of simultaneous instruments
var p = 15; // number of partials per instrument
Texture.overlapRoutine({
	var z = `[ // filter bank specification :
		Array.fill(p, { 80 + 10000.0.linrand} ),// frequencies
		Array.fill(p, { 1.0.rand2 }), // amplitudes
		Array.fill(p, { 0.2 + 8.0.rand } ) // ring times
	];
	Pan2.ar(
		Klank.ar(z, Dust.ar(0.7, 0.04)),
		1.0.rand2
	)
}, 6, 6, n, 2)

// ---- Klank - excited by noise bursts ; jmcc
var n = 5; // number of simultaneous instruments
var p = 8; // number of partials per instrument
Texture.overlapRoutine({
	var exciter = Decay.ar(Dust.ar(0.6, 0.001), 3.1, WhiteNoise.ar);
	var spec = Array.fill(2, {
		`[
			Array.fill(p, { 80 + 10000.0.linrand} ),
			nil,
			Array.fill(p, { 0.2 + 4.0.rand } )
		]
	});
	Klank.ar(spec, exciter)
}, 8, 8, n, 2)

// ---- resonators at random frequencies excited by BrownNoise
var p = 32; // number of partials per channel
Texture.xfadeRoutine({
	var noise = BrownNoise.ar(0.001);
	var spec = Array.fill(2, {
		`[
			Array.fill(p, { 80 + 10000.0.linrand} ),
			Array.fill(p, { 1.0.rand2 }), // amplitudes
			Array.fill(p, { 0.5 + 2.0.rand } )
		]
		});
	Klank.ar(spec, noise)
}, 6, 6, 2)

// ---- resonators tuned in a harmonic series with pitch ratios from a just scale
var p = 12; // number of overtones
Texture.xfadeRoutine({
	var noise = BrownNoise.ar(0.001);
	var freq = #[ 1.0, 1.125, 1.25, 1.333, 1.5, 1.667, 1.875, 2.0, // a list representing a just diatonic scale expressed as ratios.
		2.25, 2.5, 2.667, 3.0, 3.333, 3.75, 4.0 ].choose * 120.0; // one value is chosen at random and multiplied by a 120 Hz fundamental
	var spec = Array.fill(2, {
		`[ // filter bank specification
			Array.series(p, freq, freq ) + Array.fill(p, { 0.5.rand2 }),
			Array.fill(p, { arg i; 1/(i+1) }),
			Array.fill(p, { 0.5 + 4.0.rand } )
		]
	});
	Klank.ar(spec, noise)
}, 1, 7, 2)

// ---- similar to above, but tuned to odd harmonics only, shorter ring times,
// and using a different noise source
var p = 12; // number of overtones
Texture.xfadeRoutine({
	var noise = LFNoise2.ar(8000, 0.004);
	var freq = #[ 1.0, 1.125, 1.25, 1.333, 1.5, 1.667, 1.875, 2.0, // a list representing a just diatonic scale expressed as ratios.
		2.25, 2.5, 2.667, 3.0, 3.333, 3.75, 4.0 ].choose * 120.0; // one value is chosen at random and multiplied by a 120 Hz fundamental
	var spec = Array.fill(2, {
		`[
			Array.series(p, freq, 2*freq ) + Array.fill(p, { 0.5.rand2 }),
			Array.fill(p, { arg i; 1/(i+1) }),
			Array.fill(p, { 0.2 + 0.8.rand } )
		]
	});
	Klank.ar(spec, noise)
}, 1, 7, 2)

// ---- swept resonant noise band exciting a resonator bank ; jmcc
var n = 5; // number of sweepers
var p = 10; // number of partials
Texture.overlapRoutine({
	var sweep = Resonz.ar(
		WhiteNoise.ar(0.007),
		FSinOsc.kr(0.1 + 0.2.rand, 0, 12 + 12.rand2, 60 + 24.rand2).midicps,
		0.1);
	var spec = Array.fill(2, {
		`[
			Array.fill(p, { 80 + 10000.0.linrand} ),
			nil,
			Array.fill(p, { 0.5 + 2.0.rand } )
		]
	});
	Klank.ar(spec, sweep)
}, 4, 4, n, 2)

// ---- coolant ; jmcc
var p = 10; // number of partials per channel
Texture.xfadeRoutine({
	Klank.ar(
		[
			`[Array.fill(p, { 40 + 2000.0.rand }),nil,nil],
			`[Array.fill(p, { 40 + 2000.0.rand }),nil,nil]
		],
		OnePole.ar(
			BrownNoise.ar([0.002,0.002]),
			0.95
		)
	)
}, 4, 4, 2)

// ---- narrow band filtered Crackle noise ; jmcc
var e = Env.linen(2, 5, 2);
Texture.spawnRoutine({
	var rf = 2000.0.rand + 80;
	var rf2 = rf + (0.2.rand2 * rf);
	Pan2.ar(
		Resonz.ar(Crackle.ar(1.97 + 0.03.rand) * 0.15, XLine.kr(rf,rf2,9), 0.2
		), 1.0.rand2, EnvGen.ar(e,doneAction:2))
}, 2, 1)

// ---- resonant dust ; jmcc
var e = Env.linen(2, 5, 2);
Texture.spawnRoutine({
	var rf = 2000.0.rand + 80;
	var rf2 = rf + (0.5.rand2 * rf);
	Pan2.ar(EnvGen.ar(e,doneAction:2) *
		Resonz.ar(Dust.ar(50 + 800.rand, 0.3), XLine.kr(rf,rf2,9), 0.1)
		, 1.0.rand2)
}, 2, 1)

// ---- uplink ; jmcc
var n = 5;
Texture.overlapRoutine({
	var freq = LFPulse.kr(20.0.rand, 0, 1.0.rand,
		LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand));
	freq = freq + LFPulse.kr(20.0.rand, 0, 1.0.rand,
		LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand));
	Pan2.ar(LFPulse.ar(freq, 0, 0.5, 0.04), 0.8.rand2)
}, 4, 1, n, 2)

// ---- data space ; jmcc
var n = 4;
Texture.overlapRoutine({
	var freq = [
		LFPulse.kr(200.0.rand, 0, 1.0.rand, LFPulse.kr(40.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand)),
		LFPulse.kr(20.0.rand, 0, 1.0.rand, LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand)),
		LFPulse.kr(20.0.rand, 0, 1.0.rand, LFPulse.kr(4.0.rand, 0, 1.0.rand, 8000.rand, 2000.rand))
	].sum;
	var dtime = 0.25.rand + 0.1;
	CombL.ar(Pan2.ar(LFPulse.ar(freq, 0, 0.5, 0.04), LFNoise0.kr(3.0.rand, 0.8)), dtime, dtime, 3)
}, 6, 1, n, 2)

// ---- cymbalism ; jmcc
var p = 15; // number of partials per channel per 'cymbal'.
Texture.xfadeRoutine({
	var f1 = 500 + 2000.0.rand;
	var f2 = 8000.0.rand;
	var z = Array.fill(2, {
		`[ // sine oscil bank specification :
			Array.fill(p, { f1 + f2.rand} ), // frequencies
			nil, // amplitudes default to 1.0
			Array.fill(p, { 1.0 + 4.0.rand }) // ring times
		]
	});
	Klank.ar(z, Decay.ar(Impulse.ar(3.0.rand + 0.5), 0.004, WhiteNoise.ar(0.03)));
}, 4, 4, 2)

// ---- cymbalism accellerando ; jmcc
var p = 15; // number of partials per channel per 'cymbal'.
Texture.xfadeRoutine({
	var f1 = 500 + 2000.0.rand;
	var f2 = 8000.0.rand;
	var z = Array.fill(2, {
		`[ // sine oscil bank specification :
			Array.fill(p, { f1 + f2.rand} ), // frequencies
			nil, // amplitudes default to 1.0
			Array.fill(p, { 1.0 + 4.0.rand }) // ring times
		]
	});
	Klank.ar(z, Decay.ar(Impulse.ar(XLine.kr(4.0.linrand + 0.5, 35.0.rand + 0.5, 12)), 0.004,
		WhiteNoise.ar(0.03)));
}, 4, 4, 2)

// ---- ring modulated Klank ; jmcc
var n = 4; // overlap
var p = 8; // number of partials
Texture.overlapRoutine({
	var a = Klank.ar(`[Array.rand(p, 100, 10000), nil, Array.rand(p, 0.2, 1.0)],
		Dust.ar(20, 0.02));
	Pan2.ar(SinOsc.ar(LFNoise2.kr(1.0 + 0.3.rand2, 200, 350 + 50.rand), 0, a), 1.0.rand2);
}, 4, 4, 4, 2)
