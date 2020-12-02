-- lfNoise2 ; modulate frequency
let f = xLine KR 1000 10000 10 RemoveSynth
in lfNoise2 'α' AR f * 0.05
