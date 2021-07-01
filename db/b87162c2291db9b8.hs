-- pulse ; modulate frequency
let f = xLine kr 40 4000 6 RemoveSynth
in pulse ar f 0.1 * 0.1
