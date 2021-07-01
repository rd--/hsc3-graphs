-- lfNoise2 ; modulate frequency
let f = xLine kr 1000 10000 10 RemoveSynth
in lfNoise2Id 'α' ar f * 0.05
