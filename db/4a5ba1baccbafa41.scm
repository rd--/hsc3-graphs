; f0 <https://twitter.com/redFrik/status/1254441448327479299>
(let* ((b (Mce5 1 3 5 8 10))
       (e (Mce5 3 2/3 4 3/2 2))
       (c 0.021)
       (d (Mod (LfTri (Div b 999) 0) 1))
       (m (LfTri (Mul b c) 0))
       (l (Add (MulAdd m 7 20) (Dseq inf (MulAdd (Mod b m) 5 6))))
       (j (Duty (Div e (Pow 12 m)) 0 doNothing l))
       (f (MidiCps (DegreeToKey (asLocalBuf b) j 12)))
       (y (Mul (Decay2 (Impulse (Mce5 2/3 3/2 3 3/2 3) 0) c d) d))
       (o (Mul (SinOscFb f (AddDiv (LfTri (Div c b) 0) 1 3)) y)))
  (Mul (FreeVerb (Splay2 o) 0.1 1 0.5) 0.2))