// harmonic tumbling ; jmcc
{
	var f, p, z, trig;
	f = 80;	// fundamental frequency
	p = 10;	// number of partials per channel
	z = 0.0;	// start of oscil daisy chain
	trig = XLine.kr([10,10], 0.1, 60);	// trigger probability decreases over time
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 0,		// freq of partial
				Decay2.kr(
					Dust.kr(
						trig,		// trigger rate
						0.02		// trigger amplitude
					),
					0.005, 	// grain attack time
					0.5.rand	// grain decay time
				),
				z
		)
	});
	z
}
