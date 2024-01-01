(* allocate a buffer for the delay line *)
var buffer = BufAlloc(1, 48000 * 0.3).BufClear;
(* sine pulse *)
var input = FSinOsc(1000, 0) * LfPulse(0.3, 0, 0.05) * 0.3;
(* tap the delay line at 0.15 second delay and distort *)
var delayedSignal = DelayTap(buffer, 0.15).Distort;
(* mix the delayed signal with the input *)
var mixedSignal = (delayedSignal * 0.8) + input;
(* write the mixed signal to the delay line *)
var writer = DelayWrite(buffer, mixedSignal);
(* output the mixed signal *)
mixedSignal <! writer
