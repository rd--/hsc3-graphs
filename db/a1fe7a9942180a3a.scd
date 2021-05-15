// Berlin 1977 ; mouse x controls clock rate ; jmcc
{
    var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};
    var sequR = {arg s,tr; Demand.kr(tr, 0, Dshuf(s, inf))}; // sequ with random selection function
	var patternList, clockRate, clockTime, clock, note, freq, amp, filt;
	clockRate = MouseX.kr(5, 20);
	clockTime = clockRate.reciprocal;
	clock = Impulse.kr(clockRate); // sequencer trigger
	patternList = [55,60,63,62,60,67,63,58];
	note = sequ.value( patternList, clock ); // midi note pattern sequencer
		// every 16 beats transpose somewhat randomly
	note = sequR.value(
			[-12,-7,-5,0,2,5], 	// function called at each trigger
			PulseDivider.kr(clock,16))		// divide clock by 16
            +
			note; 						// add transpose to note
	freq = note.midicps;		// convert midi note to cycles per second
		// amplitude envelope
	amp = Decay2.kr(clock, 0.05 * clockTime, 2 * clockTime, 0.1, 0.02);
		// filter envelope scaled by LFO
	filt = Decay2.kr(clock, 0.05 * clockTime, 2 * clockTime, FSinOsc.kr(0.17, 0, 800), 1400);
	CombN.ar(
		RLPF.ar(
			LFPulse.ar(	// for better quality replace 'LFPulse' with 'Pulse'
				freq,0,
				SinOsc.kr(0.08, [0, 0.5pi], 0.45, 0.5), // pulse width LFO(s)
				amp
			),
			filt,
			0.15		// 1/Q
		),
		0.2, [0.2, 0.17], 1.5		// max delay, actual delay(s), decay time
	)
}
