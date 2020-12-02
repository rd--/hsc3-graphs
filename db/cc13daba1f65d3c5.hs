-- pulse ; modulate frequency
let f = xLine KR 40 4000 6 RemoveSynth
in pulse AR f 0.1 * 0.1
