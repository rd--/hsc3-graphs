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

// UNTRANS - algorhythmic rhythms

//////////////////////////////////////////////////////////////////////////

// UNTRANS - wolf tones

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
    RTexture.spawn({ arg  index;
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

// UNTRANS - screen zones

//////////////////////////////////////////////////////////////////////////

(
// slight mod of "phase mod with slow beats"
// mouse x controls random freq of new events
// mouse y controls modulation index
var e = Env.adsr(0.001, 0.01, 0.25, 0.04, 1, -4);
	var n = 4;		// number of simultaneous events
	RTexture.overlap({
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

// UNTRANS - using Sequencer to generate a chaotic waveform

//////////////////////////////////////////////////////////////////////////

// UNTRANS - making rhythms out of sampled voice

//////////////////////////////////////////////////////////////////////////
