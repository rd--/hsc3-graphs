// Inharmonic warbulence ; Jmcc ; graph rewrite (Rd)
var z = OverlapTexture({
        arg tr;
		var f, r, n, a, z;
		f = TRand.kr(24, 96, tr).midicps;
		a = min(1, (500/f));
		r = TxLine.kr(TExpRand.kr(0.1,20,tr),TExpRand.kr(0.1,20,tr), 25.6, tr);
		n = 12;
		a * Mix.arFill(n, { arg i;
			g = TRand.kr(0,n,tr) + 1;
			Pan2.ar(
				FSinOsc.ar(f*g, 0, SinOsc.kr( r * TRand.kr(0.9,1.1,tr),TRand.kr(0,2pi,tr),0.08,-0.04).max(0)) * (2/g),
				TRand.kr(-1,1,tr)
			)
		}) * 0.1}, 12.8, 6.4, 6, 2);
Mix.arFill(5, { CombN.ar(z, 0.3, [Rand(0.1,0.3),Rand(0.1,0.3)], 8) }) * 0.3;

// ---- Arachnid espresso ; Jmcc
Texture.overlapRoutine({
		var t, c, e, f, n, r, p, pf;
		#p, pf = [[1,1],[1,1],[-1,2]].choose; // choose string or pipe
		r = [8,4,2].choose;
		c = Impulse.kr(r);
		t = ImpulseSequencer.kr(([
				[1,1,0,0,0,0,0,0],
				[1,1,1,0,0,0,0,0],
				[1,1,1,1,0,0,0,0]
				].choose.scramble), c);
		e = Trig.kr(t, rrand(0.3,0.9)/r);
		f = pf*Lag.kr(Sequencer.kr((Array.fill([1,2,3,4].choose, { rrand(24,96).midicps })), t), 0.1/r);
		n = LPZ2.ar(LFNoise2.ar(min(f*24, 12000), 0.2 * e));
		Pan2.ar( CombC.ar(n, 0.1, 1/f, min(0.5,exprand(90,240)/f) * p) * 0.2, 1.0.rand2);
	}, 19, 0.5, 5, 2, postProcess: {arg signal;
	6.do({ signal = AllpassL.ar(signal, 0.03, [0.03.rand,0.03.rand], 3) });
	signal})

// ---- Inharmonic warbulence ; Jmcc
Texture.overlapRoutine({
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

// ---- Clipped inharmonic warbulence ; Jmcc
Texture.overlapRoutine({
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
	}, 12.8, 6.4, 6, 2, postProcess: {
	arg signal;
	signal = LeakDC.ar(signal);
	signal = Mix.arFill(8, { CombN.ar(signal, 0.3, [rrand(0.1,0.3),rrand(0.1,0.3)], 20) }) * 0.3;
})

// ---- Pulse harmonic warbulence ; Jmcc
Texture.overlapRoutine({
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

// ---- c.f Drone + rhythm ; Early space music LP, side 1 ; Early space music LP, side 2
