//////////////////////////////////////////////////////////////////////////

(
// sweepy noise - mouse controls LFO
{
	var lfoDepth, lfoRate, freq, filtered;
	lfoDepth = MouseY.kr(200, 8000, 'exponential');
	lfoRate = MouseX.kr(4, 60, 'exponential');
	freq = LFSaw.kr(lfoRate, 0, lfoDepth, lfoDepth * 1.2);
	filtered = RLPF.ar(WhiteNoise.ar([0.03,0.03]), freq, 0.1);
	CombN.ar(filtered, 0.3, 0.3, 2, 1, filtered);
}.play
)

//////////////////////////////////////////////////////////////////////////

(
// string wander-cluster
	var n, t, t3, note, delay;
	n = 6;
	t = 4;
	t3 = t / 3;
	note = 50 + 50.rand;
	RTexture.overlap({
		note = (note + 15.rand - 7).fold(50,120);
		delay = 1/note.midicps;
		Pan2.ar(CombC.ar(WhiteNoise.ar(0.008), 0.01, delay, delay * 1000), 1.0.rand2)
	}, t3, t3, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// string wander-cluster with vibrato
	var n, t, t3, note, freq, delay, decayTime;
	n = 6;
	t = 4;
	t3 = t / 3;
	note = 60 + 50.rand;
	RTexture.overlap({
		note = (note + 15.rand - 7).fold(60,110);
		freq = note.midicps;
		decayTime = 1/freq * 1000;
		freq = SinOsc.kr(4 + 4.0.rand, 0, 0.01 * freq, freq);
		delay = 1/freq;
		Pan2.ar(CombC.ar(WhiteNoise.ar(0.008), 0.01, delay, decayTime), 1.0.rand2)
	}, t3, t3, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// pipe wander-cluster
	var n, t, t3, note, delay;
	n = 6;
	t = 4;
	t3 = t / 3;
	note = 80 + 40.rand;
	RTexture.overlap({
		note = (note + 15.rand - 7).fold(80,120);
		delay = 1/note.midicps;
		Pan2.ar(CombL.ar(LPZ2.ar(WhiteNoise.ar(0.01)), 0.01, delay, -0.4), 1.0.rand2)
	}, t3, t3, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// comb delay sweeps
	var n, t, t3, note, endNote, noteSweep;
	n = 6;
	t = 4;
	t3 = t / 3;
	note = 50 + 70.rand;
	endNote = (note + 15.rand - 7).fold(50,120);
	RTexture.overlap({
		note = (note + 15.rand - 7).fold(50,120);
		endNote = (endNote + 15.rand - 7).fold(50,120);
		noteSweep = Line.kr(note, endNote, t);
		Pan2.ar(
			CombC.ar(WhiteNoise.ar(0.005), 0.01, 1/noteSweep.midicps, 1/note.midicps * 1000),
			1.0.rand2
		)
	}, t3, t3, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// repeating harmonic Klank
	var n, p;
	n = 4;	// number of simultaneous events
	p = 8;	// number of partials per channel
	RTexture.overlap({
		s = Decay.ar(Dust.ar(0.8, 0.01), 3.4, LFSaw.ar(40.0.linrand));
		f = #[400,500,600,700,800,900,1000,1200,1400,1500,1600].choose;
		[
			(z = Array.fill(p, { f * (12.rand + 1) } );
			y = Array.fill(p, { 3.0.rand + 0.4 } );
			Klank.ar(`[z,nil,y], s))
		,
			(z = Array.fill(p, { f * (12.rand + 1) } );
			y = Array.fill(p, { 3.0.rand + 0.4 } );
			Klank.ar(`[z,nil,y], s))
		];
	}, 8, 2, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// repeating inharmonic Klank
	var n, p;
	n = 4;	// number of simultaneous events
	p = 8;	// number of partials per channel
	RTexture.overlap({
		s = Decay.ar(Dust.ar(0.8, 0.004), 3.4, LFSaw.ar(40.0.linrand));
		[
			(z = Array.fill(p, { 80 + 10000.0.linrand} );
			y = Array.fill(p, { 4.0.rand + 0.4 } );
			Klank.ar(`[z,nil,y], s))
		,
			(z = Array.fill(p, { 80 + 10000.0.linrand} );
			y = Array.fill(p, { 4.0.rand + 0.4 } );
			Klank.ar(`[z,nil,y], s))
		];
	}, 8, 8, n, 2);
)

//////////////////////////////////////////////////////////////////////////

(
// noise burst sweep
{
	var lfoRate, amp, cfreq, filt;
	lfoRate = MouseX.kr(10, 60, 'exponential');
	amp = max(0, LFSaw.kr(lfoRate, -1));
	cfreq = MouseY.kr(400, 8000, 'exponential');
	cfreq = SinOsc.kr(0.2, 0, cfreq, 1.05 * cfreq);
	Resonz.ar(WhiteNoise.ar(amp), cfreq, 0.1);
}.play
)

//////////////////////////////////////////////////////////////////////////

(
// saucer base
	var n = 4;		// number of simultaneous events
	RTexture.overlap({
		var a, b, c, pan;
		a = 20.0.rand;
		b = 1000.0.rand;
		c = 5000.0.rand;
		pan = 1.0.rand2;
		Pan2.ar(SinOsc.ar(SinOsc.ar(SinOsc.ar(a, 0, b, 1.1*b), 0, c, 1.1*c), 0, 0.1), pan)
	}, 6, 2, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// alien meadow
	var n = 6;		// number of simultaneous events
	RTexture.overlap({
		var a, b, c, pan;
		a = 20.0.rand;
		b = 5000.0.rand;
		c = 20.0.rand;
		pan = 1.0.rand2;
		Pan2.ar(SinOsc.ar(SinOsc.ar(a, 0, 0.1*b, b), 0, SinOsc.kr(c, 0, 0.05, 0.05)), pan)
	}, 6, 2, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// fast LFOs with slow beats
	var n = 4;		// number of simultaneous events
	RTexture.overlap({
		var a, a0, a1, b, c, pan;
		a0 = 200.0.rand + 40;
		a1 = a0 + 1.0.rand2;
		a = [a0, a1];
		b = 2000.0.rand;
		c = [a0 + 1.0.rand2, a1 + 1.0.rand2];
		SinOsc.ar(SinOsc.ar(a, 0, 1.0.rand * b, b), 0, SinOsc.kr(c, 0, 0.05, 0.05))
	}, 8, 4, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// birdies
	var n = 4;		// number of simultaneous events
	RTexture.overlap({
		Pan2.ar(SinOsc.ar(
			Lag.kr(LFSaw.kr(
				LFPulse.kr(0.4 + 1.0.rand, 0, 0.8.rand + 0.1, 3.0.rand + 4, 2)
				+ LFPulse.kr(0.4 + 1.0.rand, 0, 0.8.rand + 0.1, 3.0.rand + 4),0,
				(1000 + 800.rand).neg, 4000 + 1200.rand2), 0.05),
			0, Lag.kr(LFPulse.kr(0.5.rand + 0.2, 0, 0.4, 0.02), 0.3)), 1.0.rand2);
	}, 7, 4, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// phase modulation with slow beats
// mouse x controls random freq of new events
// mouse y controls modulation index
	var n;
	n = 4;		// number of simultaneous events
	RTexture.overlap({
        var x = MouseX.kr(100, 6000, 'exponential');
        var y = MouseY.kr(0, 2);
		var a = 0;
        var f1 = Rand(0,x);
		3.do({
            var f2 = Rand(0,x);
			a = FSinOsc.ar([f2, f2+1.0.rand2], 0, y, a);
		});
		SinOsc.ar([f1, f1+1.0.rand2], a, 0.1)
	}, 4, 4, n, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// hard sync sawtooth with LFO
	var a, n;
	n = 4;	// number of simultaneous events
	a = RTexture.overlap({
		f = (30 + 50.rand).midicps;
		SyncSaw.ar([f, f + 0.2], SinOsc.kr(0.2, [0, 2pi.rand], 2*f, 3*f), 0.05);
	}, 4, 4, n, 2);
	CombN.ar(a, 0.3, 0.3, 4, 1, a.reverse);
)

//////////////////////////////////////////////////////////////////////////

(
// noise modulated sines
	var a, n;
	n = 4;	// number of simultaneous events
	a = RTexture.overlap({
		f = (60 + 40.rand).midicps;
		FSinOsc.ar([f, f + 0.2], 0, LFNoise2.kr(f*[0.15, 0.16], 0.1));
	}, 4, 4, n, 2);
	CombN.ar(a, 0.3, 0.3, 4, 1, a.reverse);
)

//////////////////////////////////////////////////////////////////////////

(
// noise modulated sawtooths
	var a, n;
	n = 4;	// number of simultaneous events
	a = RTexture.overlap({
		f = (60 + 40.rand).midicps;
		LFSaw.ar([f, f + 0.2], 0, LFNoise2.kr(f*[0.15, 0.16], 0.1));
	}, 4, 4, n, 2);
	CombN.ar(a, 0.5, 0.5, 4, 1, a.reverse);
)

//////////////////////////////////////////////////////////////////////////

// UNTRANS RLPF4 - 4th order resonant lowpass filter

//////////////////////////////////////////////////////////////////////////

// UNTRANS RLPF4 - 4th order resonant lowpass filter

//////////////////////////////////////////////////////////////////////////
