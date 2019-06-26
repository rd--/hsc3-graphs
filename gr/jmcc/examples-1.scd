"overlap-texture.scd".loadRelative; /* SC3 variants of OverlapTexture &etc. - rd */

/*
These examples are all surrounded by parentheses. You can double click to the right
of the first open paren to select the entire example. Then press the 'enter' key to
execute it. To stop execution, press cmd-period (i.e. the Apple key and the '.' key).

Some examples may be too CPU intensive for slower computers. In some examples there
are parameter variables you can change to alter the number of voices in the patch to
fit your machine's speed.

There are no samples or sound files in this example file, this is all synthesized.
*/

//////////////////////////////////////////////////////////////////////////

// Even simpler examples can be found throughout the help files.

//////////////////////////////////////////////////////////////////////////

(
// analog bubbles
{
	f = LFSaw.kr(0.4, 0, 24, LFSaw.kr([8,7.23], 0, 3, 80)).midicps; // glissando function
	CombN.ar(SinOsc.ar(f, 0, 0.04), 0.2, 0.2, 4) // echoing sine wave
}.play)

//////////////////////////////////////////////////////////////////////////

(
// LFO modulation of Pulse waves and resonant filters
play({
	CombL.ar(
		RLPF.ar(LFPulse.ar(FSinOsc.kr(0.05,0,80,160),0,0.4,0.05),
		   FSinOsc.kr([0.6,0.7],0,3600,4000), 0.2),
		0.3, [0.2,0.25], 2)
}))

//////////////////////////////////////////////////////////////////////////


(
// hell is busy
var n;
n = 8; // number of simultaneous events
	~overlap_texture.({
		Pan2.ar(
			FSinOsc.ar(400+2000.0.rand, 0, LFPulse.kr(1+10.0.rand, 0, 0.7.rand, 0.04)),
		1.0.rand2)
	}, 4, 4, n, numChannels: 2)
)

//////////////////////////////////////////////////////////////////////////

(
// pond life
var n;
n = 8; // number of simultaneous events
	~overlap_texture.({
		Pan2.ar(
			SinOsc.ar(FSinOsc.kr(20+30.0.rand, 0, 100+300.0.rand, 500 + 2000.0.linrand), 0,
				LFPulse.kr(3/(1 + 8.0.rand), 0, 0.2+0.3.rand, 0.04)),
		1.0.rand2)
	}, 8, 4, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// alien froggies
var rate = 11.0;
	~overlap_texture.({ arg rep;
		rate = (rate * (0.2.bilinrand.exp)).fold(1.0, 30.0);
		Formant.ar(rate, exprand(200,3000.0), 9.0.rand * rate + rate, 0.05)
	}, 0.5, 0.25, 5, 1)
)

//////////////////////////////////////////////////////////////////////////

(
// random sine waves
var n, env;
n = 12; // number of simultaneous events
env = Env.linen(2, 5, 2);
	~spawn.({
		Pan2.ar(
			FSinOsc.ar(2000.0.rand, 0, EnvGen.kr(env, levelScale: 0.02, doneAction: 2)),
			1.0.rand2)
	}, 2, 9/n)
)

//////////////////////////////////////////////////////////////////////////

(
// random pulsations
var n, env;
n = 8; // number of simultaneous events
env = Env.linen(2, 5, 2, 0.02);
	~spawn.({
		Pan2.ar(
			FSinOsc.ar(2000.0.rand, 0, EnvGen.kr(env,doneAction:2)).amclip(SinOsc.ar(8+80.0.linrand)),
			SinOsc.kr(0.3+0.5.rand, 2pi.rand, 0.7))
	}, 2, 9/n)
)

//////////////////////////////////////////////////////////////////////////

(
// moto rev
play({
	RLPF.ar(LFPulse.ar(SinOsc.kr(0.2, 0, 10, 21), 0, 0.1), 100, 0.1).clip2(0.4)
}))

//////////////////////////////////////////////////////////////////////////

(
// scratchy
play({  RHPF.ar(BrownNoise.ar([0.5,0.5], -0.49).max(0) * 20, 5000, 1)  })
)

//////////////////////////////////////////////////////////////////////////

(
// tremulate
		~xfade_texture.({
			f = 500 + 400.rand;
			r = 30 + 60.rand;
			Mix.ar(
				Pan2.ar(
					// just minor seventh chord
					FSinOsc.ar(f*[1.0, 1.2, 1.5, 1.8], 0, max(0, LFNoise2.kr([r,r,r,r], 0.1))),
					[1.0.rand2,1.0.rand2,1.0.rand2,1.0.rand2]
				)
			)
		}, 2, 0.5, 2, postProcess: {arg z; CombN.ar(z,0.1,0.1,1)})
)

//////////////////////////////////////////////////////////////////////////

(
// reso-pulse
~overlap_texture.({
			f = #[25, 30, 34, 37, 41, 42, 46, 49, 53, 54, 58, 61, 63, 66].choose.midicps;
			LFPulse.ar(f, 0, 0.2, 1, LFPulse.ar(2*f + 0.5.rand2, 0, 0.2, 1))
		}, 4, 2, 4, 1, postProcess: {
    arg z;
	var lfo, lfoFreq, delayTime, left, right;
	lfoFreq = 6;
	lfo = LFNoise0.kr(lfoFreq, 1000, 1200);
	left = RLPF.ar(
		z * 0.02,
		lfo,	// cutoff freq
		MouseX.kr(0.2, 0.02, 'exponential')); // filter bandwidth
	delayTime = 2/lfoFreq;
	right = DelayN.ar(left, delayTime, delayTime); // delay right channel by two beats
	[left,right]
}))


//////////////////////////////////////////////////////////////////////////

(
// sprinkler
play({
	BPZ2.ar(WhiteNoise.ar(LFPulse.kr(LFPulse.kr(0.09, 0, 0.16, 10, 7), 0, 0.25, 0.1)))
}))

(
play({
	BPZ2.ar(WhiteNoise.ar(LFPulse.kr(MouseX.kr(0.2,50), 0, 0.25, 0.1)))
}))

//////////////////////////////////////////////////////////////////////////

(
// harmonic swimming
play({
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
}))

//////////////////////////////////////////////////////////////////////////

(
// harmonic tumbling
play({
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
}))

//////////////////////////////////////////////////////////////////////////
