-- lfClipNoise ; c.f. lfDClipNoise
let f = xLine kr 1000 20000 10 RemoveSynth
in lfClipNoiseId 'δ' ar f * 0.05
