{- http://sccode.org/1-4Qy (F0) ; 0287 -}
let o = Saw((':>AEH.'.ascii.asArray - (2 ^ LfSaw([1 .. 5] / 32, 0)).Ceiling).MidiCps);
let e = o % LfSaw([1 1 6], 0) % (LfSaw(2, [1 2] / 8) * 2);
Hpf(e.Splay, 9) / 2
