; analog bubbles (jmcc) #1 ; auto-rewrite from haskell ; note MulAdd is not optimised lexically
(letrec ((o (Add (Mul (LfSaw (Mce2 8 7.23) 0) 3) 80))
         (f (Add (Mul (LfSaw 0.4 0) 24) o))
         (s (Mul (SinOsc (MidiCps f) 0) 0.04)))
  (Mul (CombN s 0.2 0.2 4) 0.5))
