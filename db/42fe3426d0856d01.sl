(* PlayBuf ; shuffler ; requires=TrigAllocator *)
var trigger = Dust(256);
var dur = TRand(0.05, 0.15, trigger);
var w = TrigAllocator(64, 1, trigger, dur);
var numChannels = 1;
var soundFile = SfAcquireMono('floating_1');
var rate = MouseY(0.5, 2, 0, 0.2) + TRand(-0.05, 0.05, w);
var startPos = MouseX(0, BufFrames(soundFile), 0, 0.2) + TRand(-0.025, 0.025, w);
var env = Sine(w, dur) / 5;
EqPan(
	PlayBuf(numChannels, soundFile, rate, w, startPos, 1, 0) * env,
	MouseX(-0.75, 0.75, 0, 0.2) + TRand(-0.25, 0.25, w)
).Sum
