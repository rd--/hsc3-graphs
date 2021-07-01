-- lfdClipNoise ; does not quantize time steps at high frequencies
let f = xLine kr 1000 20000 10 RemoveSynth
in lfdClipNoiseId 'γ' ar f * 0.05
