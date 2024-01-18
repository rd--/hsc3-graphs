{- allocate a buffer for the left delay line -}
let leftBuffer = BufAlloc(1, 48000 * 0.4).BufClear;
{- allocate a buffer for the right delay line -}
let rightBuffer = BufAlloc(1, 48000 * 0.4).BufClear;
{- make a percussive sound as input -}
let input = Decay(Impulse(0.4, 0), 0.1) * PinkNoise();
{- tap the left delay line -}
let leftDelayedSignal = DelayTap(leftBuffer, 0.3);
{- tap the left delay line -}
let rightDelayedSignal = DelayTap(rightBuffer, 0.3);
{- mix the delayed signal with the input -}
let output = [leftDelayedSignal + input, rightDelayedSignal];
{- scale delay signal -}
let toDelay = output * 0.8;
{- feedback to buffers in reverse order -}
let writer = DelayWrite([rightBuffer, leftBuffer], toDelay);
{- output with writer attached to graph -}
output <! writer
