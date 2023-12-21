(* https://scsynth.org/t/6264/2 *)
var numPartials = 64;
var spectrum = [1 .. numPartials];
var inharmonic = MouseX(0.002, 0.008, 0, 0.2);
var tension = (1 + (spectrum * spectrum * inharmonic)).Sqrt;
var tilt = MouseY(-5, -1, 0, 0.2);
var ampArray = (spectrum.log2 * tilt).DbAmp;
var freq0 = 110;
var freq = freq0 * spectrum * tension;
var sig = SinOsc(freq, { Rand(0, 2 * pi) } ! numPartials);
(sig * ampArray).Sum / numPartials
