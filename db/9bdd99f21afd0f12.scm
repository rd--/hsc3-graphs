; Shaper ; requires=wave-table (see b-gen1)
(let* ((b (ctl "tbl" 10))
       (a (Line 0 1 6 removeSynth))
       (s (Mul (SinOsc 300 0) a)))
  (Mul (Shaper b s) 0.05))
