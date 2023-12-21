; analog bubbles (jmcc) #1
(let* ((o (MulAdd (LfSaw (Mce2 8 7.23) 0) 3 80))
       (f (MulAdd (LfSaw 0.4 0) 24 o))
       (s (Mul (SinOsc (MidiCps f) 0) 0.04)))
  (Mul (CombN s 0.2 0.2 4) 0.5))
