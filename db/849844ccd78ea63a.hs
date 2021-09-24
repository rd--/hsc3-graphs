-- phasor ; as saw
let f0 = midiCps (mouseX kr 36 96 Linear 0.2)
in phasor ar 0 (f0 * sampleDur) (-1) 1 0 * 0.1
