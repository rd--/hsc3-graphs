-- lfNoise0 ; modulate frequency
let f = xLine KR 1000 10000 10 RemoveSynth
in lfNoise0 'α' AR f * 0.05
