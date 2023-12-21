(* LfSaw ; as phasor *)
var freq = LfNoise2(3) * 110 + 220;
[(LfSaw(freq, 0) * pi + pi).Sin, SinOsc(freq, 0)] * 0.1
