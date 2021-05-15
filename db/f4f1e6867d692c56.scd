// harmonic swimming ; jmcc
{
	var f, p, z, offset;
	f = 50;		// fundamental frequency
	p = 20;		// number of partials per channel
	z = 0.0;		// start of oscil daisy chain
	offset = Line.kr(0, -0.02, 60); // causes sound to separate and fade
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 0, 		// freq of partial
				max(0, 			// clip negative amplitudes to zero
					LFNoise1.kr(
						6 + [4.0.rand2, 4.0.rand2],	// amplitude rate
						0.02, 					// amplitude scale
						offset					// amplitude offset
					)
				),
				z
		)
	});
	z
}
