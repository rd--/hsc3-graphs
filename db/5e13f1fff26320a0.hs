-- lfClipNoise ; modulate frequency
let f = xLine KR 1000 10000 10 RemoveSynth
in lfClipNoise 'α' AR f * 0.05
