// Berlin 1977 ; mouse x controls clock rate ; jmcc
var patternList, clockRate, clockTime, clock, note, freq, amp, filt;
clockRate = MouseX.kr(5, 20);
clockTime = clockRate.reciprocal;
clock = Impulse.kr(clockRate); // sequencer trigger
patternList = [55,60,63,62,60,67,63,58];
note = Sequencer.kr( patternList, clock ); // midi note pattern sequencer
// every 16 beats transpose somewhat randomly
note = Sequencer.kr(
	[-12,-7,-5,0,2,5].scramble, 	// function called at each trigger
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

// Metal plate ;  mouse x controls damping, mouse y controls excitation ; Jmcc
var n = 4; // number of delay lines
var maxdt = 48000 * 0.03; // maximum delay time -- Server.default.sampleRate
// allocate buffers for the delay lines
var buffers = Array.fill(n, {LocalBuf.newFrom(Array.fill(maxdt,0))});
// assign random tap times
var tapTimes = Array.rand(n, 0.015, 0.03);
// excitation
var excitation = Decay2.ar(Impulse.ar(0.5, 0, 0.2), 0.01, 0.2, LFNoise2.ar(MouseY.kr(10, 8000)));
// tap the delay lines
var delayedSignals = n.collect({arg i; Tap.ar(buffers[i], 1, tapTimes[i])});
// filter the taps
var filteredDelays = LPF.ar(delayedSignals, MouseX.kr(10, 5000), 0.98);
// write to delay lines
n.do({arg i; RecordBuf.ar(filteredDelays[i] + excitation,buffers[i])});	// write the mixed signal to the delay line
Mix.ar(filteredDelays);	// mix 5 channels to one

// Griot modeling ; mouse x controls damping, mouse y controls excitation ; Jmcc
var maxdt = 48000 * 0.03; // maximum delay time - Server.default.sampleRate
var n = 5; // number of delay lines
// allocate buffers for the delay lines
var buffers = Array.fill(n, {LocalBuf.newFrom(Array.fill(maxdt,0))});
// assign tap times which determine the string pitches
var tapTimes = Array.series(n, 0.003, 0.0005);
// excitation (simplified!)
var env = Env.new([0,1,0], [0.01, 0.2], -2);
var excitation = n.collect({
	arg i;
	LFNoise2.ar(MouseY.kr(10, 10000), EnvGen.kr(env,Impulse.kr(n,0),levelScale:0.1.rand)) *
	((Demand.kr(Impulse.kr(n,0),0,Dbrown(0,n-1,1,inf)) - i).abs < 1);
});
// tap the delay lines
var delayedSignals = n.collect({arg i; Tap.ar(buffers[i], 1, tapTimes[i])});
// filter the taps
var filteredDelays = LPF.ar(delayedSignals, MouseX.kr(10, 10000), 0.98);
// write to delay lines
n.do({arg i; RecordBuf.ar(filteredDelays[i] + excitation[i],buffers[i])});
Mix.ar(filteredDelays).dup;	// mix 5 channels to one

// Sample and hold liquidities ; mouse x controls clock rate, mouse y controls center frequency ; Jmcc
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

// ---- Random panning sines ; Jmcc
var n = 8;
Texture.xfadeRoutine({
	Mix.ar(Array.fill(n, {
		Pan2.ar(
			FSinOsc.ar(80 + 2000.0.linrand),
			LFNoise1.kr(0.4 + 0.8.rand),
			LFNoise1.kr(0.4 + 0.8.rand, 0.4, 0.5)
		)
	})) * (0.4 / n);
}, 8, 8, 2);
