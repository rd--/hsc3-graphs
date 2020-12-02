-- sinOsc ; "When two pure tones of slightly different frequency are superposed, our ears
-- perceive audible beats at a rate given by the difference of the two frequencies."
let f0 = 220
    f1 = 221.25
    d = abs (f1 - f0)
    i = impulse AR d 0 * max (sinOsc KR 0.05 0 * 0.1) 0
in sinOsc AR (mce2 f0 f1) 0 * 0.1 + i
