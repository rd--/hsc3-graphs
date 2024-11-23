/* Bowed string (Jmcc) ; Rand */
let root = 5;
let scale = [0 2 4 5 7 9 11] + root;
let oct = [24 36 48 60 72 84];
let f = (scale.atRandom + oct.atRandom).MidiCps;
let x = BrownNoise(0.007 # 2, 0) * (LfNoise1(ExpRand(0.125, 0.5)) * 0.6 + 0.4).Max(0);
let k = RingzBank(x, 12.arithmeticSeries(f, f), 12.geometricSeries(1, Rand(0.7, 0.9)), { Rand(1, 3) } ! 12);
(k * 0.1).SoftClip
