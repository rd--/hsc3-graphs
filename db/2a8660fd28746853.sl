/* Deep trip (Jmcc) #9 ; texture=overlap,12,4,4,inf */
let f = (LfNoise1(Rand(0, 0.3)) * 60 + 70).MidiCps;
let a = LfNoise2(f * Rand(0, 0.5)) * (LfNoise1(Rand(0, 8)) * SinOsc(Rand(0, 40), 0) * 0.1).Max(0);
let s = Pan2(SinOsc(f, 0) * a, LfNoise1(Rand(0, 5)), 1);
{ CombN(s, 0.5, { Rand(0, 0.2) + 0.3 } ! 2, 20) } !> 2 + s
