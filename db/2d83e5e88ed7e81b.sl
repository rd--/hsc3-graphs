(* SinOsc ; fm ; https://github.com/Thrifleganger/VisualSynth ; requires=Voicer *)
var fmSignal = Voicer(16) { :e |
	var index = e.y * 3;
	var pitch = e.x * 24 + 48;
	var ratio = 3.5;
	var amp = 0.5;
	var gate = e.w;
	var pan = e.i * 2 - 1;
	var tone = 1;
	var attack = 0.01;
	var sustain = 0.5;
	var release = 1;
	var decay = 0.3;
	var duration = 1;
	var volModDepth = 0;
	var volModRate = 2;
	var pitchModDepth = 0;
	var pitchModRate = 2;
	var panModDepth = 0;
	var panModRate = 2;
	var indexEnv = TLine(index, 0.2, duration, gate);
	var volEnv = Adsr(gate, attack, decay, sustain, release, -4);
	var volMod = SinOsc(volModRate, 0) * volModDepth / 2 + 0.5;
	var panMod = SinOsc(panModRate, 0) * panModDepth;
	var pitchMod = SinOsc(pitchModRate, 0) * pitchModDepth;
	var mod = SinOsc(pitch * ratio, 0) * pitch * indexEnv;
	var car = SinOsc(pitch * (2 ^ (pitchMod / 1200)) + mod, 0) * volEnv * amp;
	var filter = Lpf(car * volMod, LinExp(tone, 0, 1, 200, 20000));
	EqPan2(filter, (panModDepth < 0.01).if { pan } { panMod })
}.Mix;
var delayMix = 0.5, delayTime = 0.3, delayFeedback = 0.3;
var feedbackSignal = LocalIn(2, 0);
var delayReturn = DelayL(fmSignal + feedbackSignal, 5, delayTime);
var delaySignal = (fmSignal + (delayReturn * delayMix)) <! LocalOut(delayReturn * delayFeedback);
var reverbMix = 0.5;
FreeVerb(delaySignal, reverbMix, 0.8, 0.5)
