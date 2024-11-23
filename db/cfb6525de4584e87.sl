/* DelayWrite ; karplus-strong (adc) */
let freq = 100;
let repeatFreq = 0.3;
let feedbackCoef = 0.997;
let buffer = BufAlloc(1, 48000 * 0.3).BufClear;
let exciter = Decay(Impulse(0.2, 0), 0.02) * PinkNoise();
let filterFreq = MouseY(20000, 2000, 1, 0.2);
let delayedSignal = DelayTap(buffer, 1 / freq);
let filteredSignal = Lpf(delayedSignal, filterFreq);
let mixedSignal = (filteredSignal * feedbackCoef) + exciter;
mixedSignal <! DelayWrite(buffer, mixedSignal)
