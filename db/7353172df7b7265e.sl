{- http://twitter.com/redFrik/status/1546903641575112715 ; requires=StandardL ; wait -}
let b = [0 3.084 5.028 6.972 10.056];
let k = DegreeToKey(b.asLocalBuf, 2 ^ StandardL(StandardL(b + 1 / 32, b + 1, 0.5, 0), b / 7 + 1, 0.5, 0) * 12, 12);
let f1 = (k + 36 - (StandardL(1 / 32, 1, 0.5, 0) > 0)).MidiCps;
let f2 = StandardL(b / 8 + 8, b / 5 + 1, 0.5, 0);
let fb = StandardL(1 / 3, b / 8 + 1, 0.5, 0) + 1 / 3;
let a = StandardL(b + 2 / 32, b / 9 + 1, 0.5, 0).Max(0) / 16 * AmpComp(f1, 60.MidiCps, 1 / 3);
let x = Splay2(SinOscFb(f1 + f2, fb) * a);
x + GVerb(x, 99, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).transposed.Sum
