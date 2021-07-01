-- phasor ; controls sine frequency, end frequency matches second sine
let rate = mouseX kr 0.2 2 Exponential 0.1
    tr = impulse ar rate 0
    sr = sampleRate
    x = phasor ar tr (rate / sr) 0 1 0
    f = mce [linLin x 0 1 600 1000, 1000]
in sinOsc ar f 0 * 0.1
