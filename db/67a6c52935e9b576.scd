// MiOmi ; filter and cutoff modulation
var filter_mode = LinLin.kr(LFTri.kr(0.23, 0), -1, 1, 0, 1);
var gate = LFPulse.kr(6, 0, 0.2);
var cutoff = LinLin.kr(LFTri.kr(0.2, 0), -1, 1, 0, 0.5);
MiOmi.ar(audio_in: 0, gate: gate, pit: 48, contour: 0.1, fm1: 0.5, fm2: 0.5, fb:0.5, strength: 0, filter_mode: filter_mode, cutoff: cutoff, env: 0.5)
