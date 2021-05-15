// sample and hold liquidities ; mouse x controls clock rate, mouse y controls center frequency ; jmcc
{
	var clockRate, clockTime, clock, centerFreq, freq, panPos, patch;
	clockRate = MouseX.kr(1, 200, 'exponential');
	clockTime = clockRate.reciprocal;
	clock = Impulse.kr(clockRate, 0.4);
	centerFreq = MouseY.kr(100, 8000, 'exponential');
	freq = Latch.kr(WhiteNoise.kr(centerFreq * 0.5, centerFreq), clock);
	panPos = Latch.kr(WhiteNoise.kr, clock);
	patch = CombN.ar(
			Pan2.ar(
				SinOsc.ar(
					freq,
					0,
					Decay2.kr(clock, 0.1 * clockTime, 0.9 * clockTime)
				),
				panPos
			),
			0.3, 0.3, 2
		);
	patch
}
