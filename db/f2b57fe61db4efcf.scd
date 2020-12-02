// MiTides ;chords ; tremolo
{var shape = LFTri.ar(0.11).range(0,1);
 var slope = LFTri.ar(0.2).range(0,1);
 var chord = LFNoise1.ar(0.1).range(0.5,1);
 var smooth = SinOsc.ar(LFNoise1.kr(0.2).range(0.1,10)).range(0,0.5);
 var out = MiTides.ar(200, shape, slope, smooth, chord, output_mode: 3, mul: 0.25);
 Splay.ar(out)}
