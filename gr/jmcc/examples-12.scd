"overlap-texture.scd".loadRelative; /* SC3 variants of OverlapTexture &etc. - rd */

//////////////////////////////////////////////////////////////////////

(
// ERR arachnid espresso
~overlap_texture.({
		var t, c, e, f, n, r, p, pf;
        var imp_seq = {arg s, tr; Demand.kr(tr, 0, Dseq(s,inf)) * tr};
        var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};
		#p, pf = [[1,1],[1,1],[-1,2]].choose; // choose string or pipe
		r = [8,4,2].choose;
		c = Impulse.kr(r);
		t = imp_seq.(([
				[1,1,0,0,0,0,0,0],
				[1,1,1,0,0,0,0,0],
				[1,1,1,1,0,0,0,0]
				].choose.scramble), c);
		e = Trig.kr(t, rrand(0.3,0.9)/r);
		f = pf*Lag.kr(sequ.((Array.fill([1,2,3,4].choose, { rrand(24,96).midicps })), t), 0.1/r);
		n = LPZ2.ar(LFNoise2.ar(min(f*24, 12000), 0.2 * e));
		Pan2.ar( CombC.ar(n, 0.1, 1/f, min(0.5,exprand(90,240)/f) * p) * 0.2, 1.0.rand2);
	}, 19, 0.5, 5, 2, postProcess: {arg signal;
	6.do({ signal = AllpassL.ar(signal, 0.03, [0.03.rand,0.03.rand], 3) });
	signal})
)

//////////////////////////////////////////////////////////////////////


(
// inharmonic warbulence
~overlap_texture.({
		var f, r, n, a;
		f = rrand(24, 96).midicps;
		a = min(1, (500/f));
		r = XLine.kr(exprand(0.1,20),exprand(0.1,20), 25.6);
		n = 12;
		a * Mix.arFill(n, { arg i;
			g = n.asFloat.rand + 1;
			Pan2.ar(
				FSinOsc.ar(f*g, 0, SinOsc.kr( r * rrand(0.9,1.1),2pi.rand,0.08,-0.04).max(0)) * (2/g),
				1.0.rand2
			)
		});
	}, 12.8, 6.4, 6, 2, postProcess: {arg signal;
	Mix.arFill(5, { CombN.ar(signal, 0.3, [rrand(0.1,0.3),rrand(0.1,0.3)], 8) }) * 0.3;
})
)

//////////////////////////////////////////////////////////////////////

(
// clipped inharmonic warbulence
~overlap_texture.({
	var r = LinExp.kr(LFNoise1.kr(1/16), -1,1,0.1,20);
		var f, n, a;
		f = rrand(24, 96).midicps;
		a = min(1, (500/f));
		n = 12;
		a * Mix.arFill(n, { arg i;
			g = n.asFloat.rand + 1;
			Pan2.ar(
				FSinOsc.ar(f*g, 0, SinOsc.kr( r * rrand(0.9,1.1),2pi.rand,0.08,-0.04).max(0)).max(0) * (2/g),
				1.0.rand2
			)
		});
	}, 12.8, 6.4, 6, 2, postProcess: {arg signal;
	signal = LeakDC.ar(signal);
	signal = Mix.arFill(8, { CombN.ar(signal, 0.3, [rrand(0.1,0.3),rrand(0.1,0.3)], 20) }) * 0.3;
})
)


//////////////////////////////////////////////////////////////////////


(
// pulse harmonic warbulence
~overlap_texture.({
		var f, r, n;
		f = rrand(24, 96).midicps;
		r = XLine.kr(exprand(0.1,20),exprand(0.1,20), 25.6);
		n = 12;
		Mix.arFill(n, { arg i;
			Pan2.ar(
				FSinOsc.ar(f * i + f, 0, SinOsc.kr( r * rrand(0.9,1.1),2pi.rand,0.1,-0.05).max(0)) * (1/(i+1)),
				1.0.rand2
			)
		}) * LFPulse.kr(exprand(0.2,1.2), rrand(0.1,0.2));
	}, 12.8, 6.4, 6, 2, postProcess: {arg signal;
	Mix.arFill(5, { CombN.ar(signal, 0.3, [rrand(0.1,0.3),rrand(0.1,0.3)], 8) }) * 0.5;
})
)

//////////////////////////////////////////////////////////////////////

(
// SEE drone + rhythm
{
	var a, n, scale;
	n = 8;	// number of simultaneous events
	scale = #[0, 2, 3, 5, 7, 9, 10];
	a = ~overlap_texture.({
		f = (#[24,36].choose + 0.08.rand2).midicps;
		LPF.ar(LFSaw.ar([f, f + 0.2], LFNoise2.kr(f*[0.05, 0.04], 0.06)), rrand(1000,3000));
	}, 4, 4, n, 2)
	+ ~overlap_texture.({ arg spawn, i;
		if (i > 1 and: { 0.8.coin }, {
			SinOsc.ar((#[60, 72].choose + scale.choose + [0.05.rand2, 0.05.rand2]).midicps, 0, rrand(0.04,0.07))
		},{ Plug.ar(0.0) });
	}, 4, 6, 3, 2)
	+ ~overlap_texture.({ arg spawn, i;
		if (i > 8, {
			RLPF.ar(
				Decay2.ar(ImpulseSequencer.ar(`([1,1,1,0,0,0].scramble), Impulse.ar(#[1.5,3,6].choose)), 0.004, rrand(0.2, 0.7),
					LFPulse.ar((#[48, 60, 72, 84].choose + scale.choose + [0.03.rand2, 0.03.rand2]).midicps, 0.4, rrand(0.03,0.08))),
				exprand(800,2000),
				0.1)
		},{ Plug.ar(0.0) });
	}, 6, 6, 6, 2);
	CombN.ar(a, 0.5, 0.5, 6, 1, a.reverse);
}.play
)

//////////////////////////////////////////////////////////////////////

(
// SEE early space music LP, side 1
{
	var a, n;
	var scale, octave, out;
	scale = [0, 2, 4, 5, 7, 9, 11];
	octave = [24, 36, 48, 60, 72, 84, 96] - 3;
	n = 6;	// number of simultaneous events
	a = ~overlap_texture.({
		[{
			var f, x;
			f = (scale.choose + octave.choose).midicps;
			x = LPZ2.ar(LPZ2.ar(
				Mix.arFill(10, {
					var ff;
					ff = f * SinOsc.kr(exprand(4,6),0,0.008,1);
					LFSaw.ar([ff * rrand(0.99,1.01), ff * rrand(0.99,1.01)], 0.01)
				})
			));
			if (0.3.coin && (f < 1400), {
				x = RLPF.ar(x, SinOsc.kr(rrand(0.3,0.8),0,f*rrand(0.5,3), f * rrand(4,12)), 0.1)
			});
			x
		},{
			var rates;
			rates = XLine.kr(
					exprand(4,12) * [1,rrand(0.9,1.1)],
					exprand(4,12) * [1,rrand(0.9,1.1)],
					12) * [1,-1].choose;
			f = LFTri.kr(exprand(0.25,0.5) * [1,-1].choose, linrand(4,30),
				LFSaw.kr(rates, rrand(2,16), rrand(40,120))).midicps;
			CombN.ar(SinOsc.ar(f, 0, 0.02), 0.3, rrand(0.15,0.3), 4)
		}].choose.value;
	}, 4, 4, n, 2);

	CombN.ar(a, 0.5, [0.5,0.47], 7, 1, a.reverse);
}.play
)

//////////////////////////////////////////////////////////////////////

(
// SEE early space music LP, side 2
Synth.play({
	var n = 6, out;		// number of simultaneous events
	out = ~overlap_texture.({ arg spawn, i, synth;
		[{
			var a, b, c, pan;
			a = 20.0.rand;
			b = 5000.0.rand;
			c = 20.0.rand;
			pan = 1.0.rand2;
			Pan2.ar(SinOsc.ar(SinOsc.ar(a, 0, 0.1*b, b), 0, SinOsc.kr(c, 0, 0.08, 0.08)), pan)
		},{
			var a, a0, a1, b, c, pan;
			a0 = 200.0.rand + 40;
			a1 = a0 + 1.0.rand2;
			a = [a0, a1];
			b = exprand(50,2400);
			c = [a0 + 1.0.rand2, a1 + 1.0.rand2];
			SinOsc.ar(SinOsc.ar(a, 0, 1.0.rand * b, b), 0, SinOsc.kr(c, 0, 0.025, 0.025))
		},{
			var f;
			f = (60 + 40.rand).midicps;
			FSinOsc.ar([f, f + 0.2], LFNoise2.kr(f*[0.15, 0.16], 0.1));
		},{
			var f, r, n;
			f = rrand(24, 96).midicps;
			r = XLine.kr(exprand(0.1,20),exprand(0.1,20), 25.6);
			n = 12;
			Mix.arFill(n, { arg i;
				Pan2.ar(
					FSinOsc.ar(f * i + f, SinOsc.kr( r * rrand(0.9,1.1),2pi.rand,0.1,-0.05).max(0)) * (1/(i+1)),
					1.0.rand2
				)
			}) * LFPulse.kr(exprand(0.2,1.2), rrand(0.1,0.2));
		},{
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

			Pan2.ar( Resonz.ar(PinkNoise.ar(10), freqCtl, 0.002), 1.0.rand2);
		},{
			var f, z, s;
			f = LFNoise1.kr(0.3.rand, 60, 70).midicps;
			z = SinOsc.ar(f, 0,
				LFNoise2.ar(
					f * 0.5.rand,
					LFNoise1.kr(8.0.rand, SinOsc.kr(40.0.rand,0,0.1)).max(0)
				)
			);
			s = Pan2.ar(z, LFNoise1.kr(5.0.rand));
		},{
			var z, f1, f2, f3, in, out, p = 15;
			f1 = 100;
			f2 = 6000.0;
			z = Array.fill(2, {
				`[	// sine oscil bank specification :
					y = Array.fill(p, { exprand(f1, f2) } ), // frequencies
					nil, 							// amplitudes default to 1.0
					Array.fill(p, { 2.0 + 4.0.rand })	// ring times
				]
			});
			f3 = XLine.kr(exprand(40.0, 300.0), exprand(40.0, 300.0), 12);
			in = LFPulse.ar(f3, rrand(0.1, 0.9), 0.002 * LFNoise2.kr(8.0.rand).max(0));
			out = Klank.ar(z, in).distort * 0.3;
		}].choose.value;
	}, 2, 4, n, 2);
	Mix.arFill(5, { CombN.ar(out, 0.3, [rrand(0.1,0.3),rrand(0.1,0.3)], 8) }) * 0.3;
});
)

//////////////////////////////////////////////////////////////////////
