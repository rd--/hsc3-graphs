// Sweepy noise ; Mouse controls lfo ; Jmcc
var lfoDepth, lfoRate, freq, filtered;
lfoDepth = MouseY.kr(200, 8000, 'exponential');
lfoRate = MouseX.kr(4, 60, 'exponential');
freq = LFSaw.kr(lfoRate, 0, lfoDepth, lfoDepth * 1.2);
filtered = RLPF.ar(WhiteNoise.ar([0.03,0.03]), freq, 0.1);
CombN.ar(filtered, 0.3, 0.3, 2, 1, filtered)
