(* allocate a buffer for the left delay line *)
var leftBuffer = BufAlloc(1, 48000 * 0.4).BufClear;
(* allocate a buffer for the right delay line *)
var rightBuffer = BufAlloc(1, 48000 * 0.4).BufClear;
(* make a percussive sound as input *)
var input = Decay(Impulse(0.4, 0), 0.1) * PinkNoise();
(* tap the left delay line *)
var leftDelayedSignal = DelayTap(leftBuffer, 0.3);
(* tap the left delay line *)
var rightDelayedSignal = DelayTap(rightBuffer, 0.3);
(* mix the delayed signal with the input *)
var output = [leftDelayedSignal + input, rightDelayedSignal];
(* scale delay signal *)
var toDelay = output * 0.8;
(* feedback to buffers in reverse order *)
var writer = DelayWrite([rightBuffer, leftBuffer], toDelay);
(* output with writer attached to graph *)
output <! writer
