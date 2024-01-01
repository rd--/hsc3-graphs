(* allocate a buffer for the delay line *)
var buffer = BufAlloc(1, 48000 * 0.3).BufClear;
(* make a percussive sound as input *)
var input = Decay(Impulse(1, 0), 0.2) * PinkNoise();
(* tap the delay line at 0.15 second delay *)
var delayedSignal = DelayTap(buffer, 0.15);
(* mix the delayed signal with the input *)
var mixedSignal = (delayedSignal * 0.4) + input;
(* write the mixed signal to the delay line *)
var writer = DelayWrite(buffer, mixedSignal);
(* output the mixed signal *)
mixedSignal <! writer
