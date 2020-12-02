// MiTides ; slope
{var slope = LFTri.ar(0.11).range(0,1);
 MiTides.ar(100, 0.5, slope, output_mode: 2, mul: 0.5)[0]}
