(* PlayBuf ; shuffler ; requires=TrigAllocator *)
let trigger = Dust(256);
let dur = TRand(0.05, 0.15, trigger);
let w = TrigAllocator(64, 1, trigger, dur);
let numChannels = 1;
let soundFile = SfAcquireMono('floating_1');
let rate = MouseY(0.5, 2, 0, 0.2) + TRand(-0.05, 0.05, w);
let startPos = MouseX(0, BufFrames(soundFile), 0, 0.2) + TRand(-0.025, 0.025, w);
let env = Sine(w, dur) / 5;
EqPan(
	PlayBuf(numChannels, soundFile, rate, w, startPos, 1, 0) * env,
	MouseX(-0.75, 0.75, 0, 0.2) + TRand(-0.25, 0.25, w)
).Sum
