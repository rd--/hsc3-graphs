// input thru
SoundIn.ar([0,1])

// distort input
var gain;
gain = MouseX.kr(1,100,'exponential');	// mouse x controls gain into distortion
SoundIn.ar([0,1], gain).distort * 0.4

// ring modulate input
var input, modulator;
input = SoundIn.ar([0,1]);
modulator = SinOsc.ar(
	MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
	[0,0.5pi]						// offset phase ofone osc by 90 degrees
);
input * modulator

// ring modulate input using ring1
var input, modulator;
input = SoundIn.ar([0,1], 0.5);
modulator = SinOsc.ar(
	MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
	[0,0.5pi]						// offset phase ofone osc by 90 degrees
);
input ring1: modulator

// filter the input
var rQ;
rQ = MouseY.kr(0.01, 1, 'exponential'); // bandwidth ratio = 1/Q
RLPF.ar(
	SoundIn.ar([0,1], 0.4 * rQ.sqrt),		// attenuate to offset resonance
	MouseX.kr(100, 12000, 'exponential'), 	// mouse x controls cutoff freq
	rQ
)

// input limiter
CompanderD.ar(
	SoundIn.ar([0,1]),
	MouseX.kr(0.01, 0.5), 		// threshold
	1, 		// below threshold slope
	0.1		// above threshold slope
)

// input noise gate
var input;
input = SoundIn.ar([0,1]);
Compander.ar(
	input, input,
	MouseX.kr(0.01, 0.5), 		// threshold
	10, 		// below threshold slope
	1		// above threshold slope
)

// pitch shift input
PitchShift.ar(
	SoundIn.ar([0,1],0.5),	// stereo audio input
	0.04, 			// grain size
	MouseX.kr(0,2), // mouse x controls pitch shift ratio
	0, 			// pitch dispersion
	0.004			// time dispersion
)

// use PitchShift to granulate input ; upper left corner is normal playback. x = pitch dispersion, y = time dispersion
var grainSize;
grainSize = 0.1;
PitchShift.ar(
	SoundIn.ar([0,1],0.5),
	grainSize,
	1,					// nominal pitch rate = 1
	MouseX.kr(0,1), 		// pitch dispersion
	MouseY.kr(0, grainSize)	// time dispersion
)

// echo input
var in;
in = SoundIn.ar([0,1], 0.1);
CombL.ar(
	in,
	0.5, 				// max delay time
	MouseX.kr(0,0.5),	// mouse x controls delay time
	4,				// echo 60 dB decay time in seconds
	1, 				// scale by unity
	in				// mix with input
)

// ring modulate & echo input
var in;
in = SoundIn.ar([0,1], 0.4) * SinOsc.ar(MouseX.kr(10,2000,'exponential'), [0,0.5pi]);
CombL.ar(
	in,
	0.5,
	MouseY.kr(0,0.5),	// mouse y controls delay time
	4,				// echo 60 dB decay time in seconds
	1, 				// scale by unity
	in				// mix with input
)

// ring modulated and resonant filtered input
var input, modulator;
input = SoundIn.ar([0,1],0.2);
modulator = SinOsc.ar(
	MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
	[0,0.5pi]						// offset phase ofone osc by 90 degrees
);
RLPF.ar(
	input * modulator, 					// do ring modulation
	MouseY.kr(100, 12000, 'exponential'), 	// mouse y controls cutoff freq
	0.1)								// bandwidth ratio = 1/Q

// distort, ring modulate & echo input - a real noise fest
var in;
in = SoundIn.ar([0,1], 20).distort.ring1(
	SinOsc.ar(MouseX.kr(10,2000,'exponential'), [0,0.5pi])
) * 0.02;
CombL.ar(
	in,
	0.5,
	MouseY.kr(0,0.5), // mouse y controls delay time
	4,
	1,
	in
)

// sweep verb
var s, z, y;
s = SoundIn.ar([0,1], 0.01) ;
// reverb predelay time :
z = DelayN.ar(Mix.ar(s), 0.048);
// 6 modulated comb delays in parallel :
y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(6,{0.1.rand}), 0.04, 0.05), 15));
// chain of 4 allpass delays on each of two channels (8 total) :
4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
// eliminate DC
LeakDC.ar(y)

// monastic resonance ; mouse controls size and reverb time
var s, z, y, decayTime, delayScale;
decayTime = MouseX.kr(0,16);
delayScale = MouseY.kr(0.01, 1);
s = SoundIn.ar([0,1], 0.005) ;
// reverb predelay time :
z = DelayN.ar(Mix.ar(s), 0.048);
// 8 comb delays in parallel :
y = Mix.ar(CombL.ar(z, 0.1, Array.fill(8,{0.04.rand2 + 0.05}) * delayScale, decayTime));
// chain of 5 allpass delays on each of two channels (10 total) :
5.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
// eliminate DC
LeakDC.ar(y)

// ---- ; untranslated

// loop recorder - previous delay contents are ducked when there is new input
