; https://twitter.com/redFrik/status/1125557217086857216 (f0)
(let* ((scl (list 0 2.94 4.98 7.02 9.96))
       (b (Fdiv (AddMul (mceFromTo -7 6) 0.7 2) 666))
       (i (Mod (MulAdd (Mul (LFTri b b) (LFTri b 0)) 9 9) 32))
       (m (Add (DegreeToKey (asLocalBuf scl) i 12) 24))
       (o (Mul5 (VarSaw (MidiCps m) 0 (AddDiv (LFTri b 0) 1 2)) (AmpComp m 440 1/3) (LFTri b b) b 9))
       (s (RLPF o (Mul (Lag2 m (Mod (Fdiv 1 b) 1)) 3) 1)))
 (Tanh (Splay (AllpassN s 0.3 (Sub 0.2 b) 3) 1 1 0 #t)))