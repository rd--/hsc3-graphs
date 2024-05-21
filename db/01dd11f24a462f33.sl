{- nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899 ; requires=crossedMultiply (⊗) -}
let x = [4 4.5; 2 3 5 6];
let z = x.crossedMultiply(x.crossedMultiply(x).tuples);
let y = (z * 4).++.clump(2) ++ [0];
let f = Sequencer(y, Impulse(5, 0));
GVerb(
	VarSaw(f, 0, 0.9) * LfPulse(5, 0, 0.5).Lag(0.01),
	99, 5, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
).transposed.Mix / 15
