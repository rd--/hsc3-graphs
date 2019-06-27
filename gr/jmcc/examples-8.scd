"overlap-texture.scd".loadRelative; /* SC3 variants of OverlapTexture &etc. - rd */

/*
These examples are all surrounded by parentheses. You can double click to the right
of the first open paren to select the entire example. Then press the 'enter' key to
execute it. To stop execution, press cmd-period (i.e. the Apple key and the '.' key).

Some examples may be too CPU intensive for slower computers. In some examples there
are parameter variables you can change to alter the number of voices in the patch to
fit your machine.

There are no samples or sound files in this example file, this is all synthesized.
*/

//////////////////////////////////////////////////////////////////////////

(
// modal space
// mouse x controls discrete pitch in dorian mode
scope({
	var mix;

	mix =

	// lead tone
	SinOsc.ar(
		(DegreeToKey.kr(
			LocalBuf.newFrom([0,2,3,5,7,9,10]),
			MouseX.kr(0,15),	// mouse indexes into scale
			12)				// 12 notes per octave
			+ 72
		    + LFNoise1.kr(3, [0.04,0.04])).midicps,
		0,
		0.1)

	// drone 5ths
	+ RLPF.ar(LFPulse.ar([48,55].midicps, 0, 0.15),
		SinOsc.kr(0.1, 0, 10, 72).midicps, 0.1, 0.1);
	CombN.ar(mix, 0.31, 0.31, 2, 1, mix)
})
)

//////////////////////////////////////////////////////////////////////////

(
// UNTRANS algorhythmic rhythms
play({ arg synth;
	var t;

	t = LFPulse.ar(8); // use a pulse wave as a trigger

	Mix.arFill(8, {
		var pat, freq;
		freq = Plug.kr(exprand(100, 3200), 0);
		pat = `scramble([1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0]);
		synth.repeat(4, 4, {
			if (0.2.coin, {						// 20 % chance of changing
				pat.value = pat.value.scramble;		// scramble the rhythm
				freq.source = exprand(100, 3200);	// set a random frequency
			});
		});
		Pan2.ar(
			Decay2.ar(
				ImpulseSequencer.ar(pat, t),
				0.002, 0.3, Resonz.ar(WhiteNoise.ar(4), freq, 0.008).softclip),
			1.0.rand2)
	})
	+
	Resonz.ar( // shaker
		HPZ2.ar(Dust2.ar( Lag.kr( LFPulse.kr(2, 0.12, 10000), 0.1), 2 )),
		SinOsc.kr(2, 0, 400, 4000), 0.2
	)
	+
	Decay2.ar(	// bass drum
		ImpulseSequencer.ar(`#[1,0,0.2,0,0.4,0,0.2,0], t),
		0.001, 0.5, SinOsc.ar(80, 0, 0.2));
}))

//////////////////////////////////////////////////////////////////////////

(
// UNTRANS wolf tones
{ arg synth;
	var mix;
	mix = Mix.arFill(4, {
		 var lagCtl, freqCtl;

		 lagCtl = Plug.kr(0.1, 0);
		 freqCtl = Plug.kr(600.0.rand + 200, lagCtl);

		synth.sched(0, { arg syn, now, task;
			var dur;
			dur = #[0.0625, 0.125, 0.5, 2].choose;
			lagCtl.source = dur * 0.5;
			freqCtl.source = 600.0.rand + 200;
			syn.sched(dur, task);
		});

		Pan2.ar( Resonz.ar(PinkNoise.ar(4), freqCtl, 0.002), 1.0.rand2);
	});
	CombN.ar(mix, 0.1, [0.09, 0.08], 1.0, 0.5, mix);
}.play
)

//////////////////////////////////////////////////////////////////////////

(
// modified from a patch by Landon Rose.
var e,  specList, tring;

tring = #[3, 3, 3, 3];
specList	= [
			`[ [32,43,54, 89].midicps, nil, tring ],
			`[ [10,34,80,120].midicps, nil, tring ],
			`[ [67,88,90,100].midicps, nil, tring ],
			`[ [14,23,34, 45].midicps, nil, tring ],
			`[ [76,88,99,124].midicps, nil, tring ]
		] ;

e = Env.sine(4,1);
    ~spawn.({ arg  index;
        EnvGen.ar(
            e) *
            Klank.ar(
                specList.wrapAt(index),
                PinkNoise.ar([0.001,0.001])
            )
        },
        2,        // two channels
        2         // nextTime
    )
)

//////////////////////////////////////////////////////////////////////////

(
// UNTRANS screen zones
// screen is divided into 4 quadrants with a different process in each one.
var zone;
// a function to create screen zones:
zone = { arg func, boundsRect;
	var x, y;
	x = MouseX.kr;
	y = MouseY.kr;
	Pause.ar(func,
		(x >= boundsRect.left) * (x < boundsRect.right)
		* (y >= boundsRect.top) * (y < boundsRect.bottom))
};

Synth.play({
	var am;
	am = SinOsc.kr(6,0,0.05, 0.15);
	Mix.ar([
		zone.value({ PinkNoise.ar(am) }, Rect.new(0, 0, 0.5, 0.5)),
		zone.value({ SinOsc.ar(700, 0, am) }, Rect.new(0.5, 0, 1, 0.5)),
		zone.value({ LFSaw.ar(100, 0.5*am) }, Rect.new(0, 0.5, 0.5, 1)),
		zone.value({ Formant.ar(21, 2100, 80, am) }, Rect.new(0.5, 0.5, 1, 1))
	]);
})
)

//////////////////////////////////////////////////////////////////////////

(
// slight mod of "phase mod with slow beats"
// mouse x controls random freq of new events
// mouse y controls modulation index
var e = Env.adsr(0.001, 0.01, 0.25, 0.04, 1, -4);
	var n = 4;		// number of simultaneous events
	~overlap_texture.({
	var x = MouseX.kr(100, 6000, 'exponential');
	var y = MouseY.kr(0, 2);
		var ph = 0;
		var f1 = Rand(0,x);
		var rate = ExpRand(10.0, 40.0);
		var gate = Impulse.kr(XLine.kr(rate, [3,0.3].choose * rate, 12,doneAction:2));
		3.do({
			var f2 = Rand(0,x);
			ph = FSinOsc.ar([f2, f2 + 1.0.rand2], 0, y, ph);
		});
		EnvGen.ar(e, gate) * SinOsc.ar([f1, f1 + 1.0.rand2], ph, 0.1)
	}, 4, 4, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// UNTRANS using Sequencer to generate a chaotic waveform
// MouseY controls chaos parameter
// MouseX controls sequencer clock frequency
{ arg synth;
	var x, a;
	x = 1.0.rand;						// initial value
	a = MouseY.kr(3.4, 3.99);				// chaos parameter
	f = MouseX.kr(100,10000,'exponential');	// clock frequency
	LPF.ar(					// use a filter to smooth off the edges
		Sequencer.ar(
			{
				x = a.poll * x * (1.0 - x);	// chaotic equation
			},
			Impulse.ar(f)	// trigger clock
		) - 0.72,			// subtract approximate DC bias
		f				// cutoff freq
	);
}.scope(0.2);
)

//////////////////////////////////////////////////////////////////////////

(
// UNTRANS making rhythms out of sampled voice
var filename, sound, signal;
filename = ":Sounds:floating_1";
sound = SoundFile.new;
if (sound.read(filename), {
	signal = sound.data.at(0);
	play({ arg synth;
		var t;

		t = LFPulse.ar(8); // use a pulse wave as a trigger

		Mix.arFill(8, {
			var pat, rate;
			rate = Plug.kr(exprand(0.4, 2.5), 0);
			pat = `scramble([1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0]);
			synth.repeat(4, 4, {
				if (0.1.coin, {						// 10 % chance of changing
					pat.value = pat.value.scramble;		// scramble the rhythm
					rate.source = exprand(0.4, 2.5);	// set a random frequency
				});
			});
			Pan2.ar(
				Decay2.ar(
					ImpulseSequencer.ar(pat, t),
					0.002, 0.3, PlayBuf.ar(signal, sound.sampleRate, rate, 0, 0, signal.size-2, 0.6)),
				1.0.rand2)
		})
		+
		Resonz.ar( // shaker
			HPZ2.ar(Dust2.ar( Lag.kr( LFPulse.kr(2, 0.12, 10000), 0.1), 2 )),
			SinOsc.kr(2, 0, 400, 4000), 0.2
		)
		+
		Decay2.ar(	// bass drum
			ImpulseSequencer.ar(`#[1,0,0.2,0,0.4,0,0.2,0], t),
			0.001, 0.5, SinOsc.ar(80, 0, 0.2));
	})
})

)

//////////////////////////////////////////////////////////////////////////
