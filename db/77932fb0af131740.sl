(* https://scsynth.org/t/6264/2 *)
let numPartials = 64;
let spectrum = [1 .. numPartials];
let inharmonic = MouseX(0.002, 0.008, 0, 0.2);
let tension = (1 + (spectrum * spectrum * inharmonic)).Sqrt;
let tilt = MouseY(-5, -1, 0, 0.2);
let ampArray = (spectrum.log2 * tilt).DbAmp;
let freq0 = 110;
let freq = freq0 * spectrum * tension;
let sig = SinOsc(freq, { Rand(0, 2 * pi) } ! numPartials);
(sig * ampArray).Sum / numPartials
