{- allocate a buffer for the delay line -}
let buffer = BufAlloc(1, 48000 * 0.3).BufClear;
{- make a percussive sound as input -}
let input = Decay(Impulse(1, 0), 0.2) * PinkNoise();
{- tap the delay line at 0.15 second delay -}
let delayedSignal = DelayTap(buffer, 0.15);
{- mix the delayed signal with the input -}
let mixedSignal = (delayedSignal * 0.4) + input;
{- write the mixed signal to the delay line -}
let writer = DelayWrite(buffer, mixedSignal);
{- output the mixed signal -}
mixedSignal <! writer
