-- lfClipNoise ; c.f. lfDClipNoise
let f = xLine KR 1000 20000 10 RemoveSynth
in lfClipNoise 'δ' AR f * 0.05
