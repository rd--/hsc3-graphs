-- phasor ; as sinOsc
let f0 = midiCps (mouseX kr 36 96 Linear 0.2)
    ph = phasor ar 0 (f0 * sampleDur) 0 1 0 * two_pi
in sin ph * 0.1
