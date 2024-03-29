{-********* Reverberated sine percussion ; Jmc -}
let d = 10; {- number of percolators -}
let c = 7; {- number of comb delays -}
let a = 4; {- number of allpass delays -}
let s = Sum({ Resonz(Dust(2 / d) * 50, 200 + 3000.Rand0, 0.003) } ! d); {- sine percolation sound -}
let z = DelayN(s, 0.048, 0.048); {- reverb predelay time -}
let y = Sum(CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! c).MulAdd(0.04, 0.05), 15)); {- 7 length modulated comb delays in parallel -}
a.timesRepeat { {- chain of 4 allpass delays on each of two channels (8 total) -}
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
s + (0.2 * y) {- add original sound to reverb and play it -}
