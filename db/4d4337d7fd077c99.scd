// pink noise, frequencies emerge ; https://github.com/cianoc/supercollider_fragments
{RLPF.ar(PinkNoise.ar(0.3), LFNoise0.kr([12, 12], 500, 500), 0.2)}
