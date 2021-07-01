-- lfClipNoise ; modulate frequency
let f = xLine kr 1000 10000 10 RemoveSynth
in lfClipNoiseId 'α' ar f * 0.05
