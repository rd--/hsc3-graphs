; Shaper ; requires=wave-table (see b-gen1)
(let* ((b (ctl kr "tbl" 10))
       (a (Line kr 0 1 6 removeSynth))
       (s (Mul (SinOsc ar 300 0) a)))
  (Mul (Shaper b s) 0.05))
