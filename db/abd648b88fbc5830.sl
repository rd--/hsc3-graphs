{- allocate a buffer for the delay line -}
let buffer = BufAlloc(1, 48000 * 0.3).BufClear;
{- sine pulse -}
let input = FSinOsc(1000, 0) * LfPulse(0.3, 0, 0.05) * 0.3;
{- tap the delay line at 0.15 seconds -}
let delayed = DelayTap(buffer, 0.15);
{- apply pitch shift -}
let shifted = PitchShift(delayed, 0.2, 5 / 7, 0.01, 0.01);
{- mix the delayed signal with the input -}
let mixedSignal = (shifted * 0.8) + input;
{- write the mixed signal to the delay line -}
let writer = DelayWrite(buffer, mixedSignal);
{- output the mixed signal -}
mixedSignal <! writer
