-- lfdClipNoise ; does not quantize time steps at high frequencies
let f = xLine KR 1000 20000 10 RemoveSynth
in lfdClipNoise 'γ' AR f * 0.05
