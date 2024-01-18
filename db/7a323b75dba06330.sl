{- https://twitter.com/lukiss163/status/1617212405737472002 (lnu) -}
let c = [
	15 20 25 31 36 41 47 51 56 61 67 72 77 83 87 92 97 103;
	15 21 26 31 36 41 46 51 57 62 67 72 77 82 87 93 98 103;
	16 20 25 31 36 41 46 52 56 61 67 72 77 82 88 92 97 103;
	15 20 26 31 36 41 46 51 56 62 67 72 77 82 87 92 98 103;
	15 21 26 31 36 41 47 51 57 62 67 72 77 83 87 93 98 103;
	15 20 26 31 36 41 47 51 56 62 67 72 77 83 87 92 98 103;
	15 20 25 31 36 41 46 51 56 61 67 72 77 82 87 92 97 103;
	15 20 25 30 36 40 46 51 56 61 66 72 76 82 87 92 97 102;
	16 20 26 31 36 41 47 52 56 62 67 72 77 83 88 92 98 103;
	16 21 26 31 36 41 47 52 57 62 67 72 77 83 88 93 98 103;
	16 20 25 31 36 42 47 52 56 61 67 72 78 83 88 92 97 103;
	15 20 26 31 36 42 47 51 56 62 67 72 78 83 87 92 98 103;
	16 20 26 31 36 41 46 52 56 62 67 72 77 82 88 92 98 103;
	16 21 26 31 36 41 46 52 57 62 67 72 77 82 88 93 98 103;
	16 21 26 31 36 42 47 52 57 62 67 72 78 83 88 93 98 103;
	15 20 26 31 36 41 46 51 56 62 67 72 77 82 87 92 98 103;
	15 21 26 31 36 42 46 51 57 62 67 72 78 82 87 93 98 103;
	16 20 26 31 36 41 46 52 56 62 67 72 77 82 88 92 98 103;
	16 20 26 31 36 41 46 52 56 62 67 72 77 82 88 92 98 103;
	16 20 26 31 36 42 46 52 56 62 67 72 78 82 88 92 98 103;
	16 20 25 31 36 41 47 52 56 61 67 72 77 83 88 92 97 103;
	16 22 25 32 36 42 47 52 58 61 68 72 78 83 88 94 97 104;
	16 22 26 32 36 42 47 52 58 62 68 72 78 83 88 94 98 104;
	15 20 25 30 36 41 46 51 56 61 66 72 77 82 87 92 97 102;
	15 20 26 31 36 41 46 51 56 62 67 72 77 82 87 92 98 103;
	16 21 25 31 36 41 46 52 57 61 67 72 77 82 88 93 97 103;
	16 21 26 31 36 41 47 52 57 62 67 72 77 83 88 93 98 103;
	16 20 26 30 36 41 46 52 56 62 66 72 77 82 88 92 98 102;
	15 21 25 31 36 41 47 51 57 61 67 72 77 83 87 93 97 103;
	15 20 25 31 36 42 47 51 56 61 67 72 78 83 87 92 97 103;
	16 21 25 31 36 42 47 52 57 61 67 72 78 83 88 93 97 103
].atRandom;
Splay(
	LeakDc(
		[
			c.MidiCps.collect { :freq |
				SinOsc(freq, 0)
			},
			SinOsc(2 / c.Log10, 0),
			LfSaw(11 / c.Neg, 0).Max(0).Lag3(0.1)
		].product,
		0.995
	),
	SinOsc(1 / c.first, 0)
)
