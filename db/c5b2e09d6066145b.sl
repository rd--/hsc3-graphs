(* Max *)
var freq = { LfNoise2(1) } ! 3 * 100 + 200;
var freqMax = freq.reduce { :i :j | i.Max(j) };
(LfTri(freqMax, 0) * 0.05) + (SinOsc(freq, 0).Splay * 0.1)