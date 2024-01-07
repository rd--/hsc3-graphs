(* SinOsc ; fm ; https://github.com/Thrifleganger/VisualSynth ; requires=Voicer *)
let fmSignal = Voicer(1, 16) { :e |
	let index = e.y * 3;
	let pitch = e.x * 24 + 48;
	let ratio = 3.5;
	let amp = 0.5;
	let gate = e.w;
	let pan = e.i * 2 - 1;
	let tone = 1;
	let attack = 0.01;
	let sustain = 0.5;
	let release = 1;
	let decay = 0.3;
	let duration = 1;
	let volModDepth = 0;
	let volModRate = 2;
	let pitchModDepth = 0;
	let pitchModRate = 2;
	let panModDepth = 0;
	let panModRate = 2;
	let indexEnv = TLine(index, 0.2, duration, gate);
	let volEnv = Adsr(gate, attack, decay, sustain, release, -4);
	let volMod = SinOsc(volModRate, 0) * volModDepth / 2 + 0.5;
	let panMod = SinOsc(panModRate, 0) * panModDepth;
	let pitchMod = SinOsc(pitchModRate, 0) * pitchModDepth;
	let mod = SinOsc(pitch * ratio, 0) * pitch * indexEnv;
	let car = SinOsc(pitch * (2 ^ (pitchMod / 1200)) + mod, 0) * volEnv * amp;
	let filter = Lpf(car * volMod, LinExp(tone, 0, 1, 200, 20000));
	EqPan2(filter, (panModDepth < 0.01).if { pan } { panMod })
}.Mix;
let delayMix = 0.5;
let delayTime = 0.3;
let delayFeedback = 0.3;
let feedbackSignal = LocalIn(2, 0);
let delayReturn = DelayL(fmSignal + feedbackSignal, 5, delayTime);
let delaySignal = (fmSignal + (delayReturn * delayMix)) <! LocalOut(delayReturn * delayFeedback);
let reverbMix = 0.5;
FreeVerb(delaySignal, reverbMix, 0.8, 0.5)
