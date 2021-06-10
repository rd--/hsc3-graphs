; rand
(let* ((a (Line kr 0.1 0 0.1 removeSynth))
       (p (Rand -1 1))
       (s (Mul (FSinOsc ar (Rand 200 1200) 0) a)))
  (Pan2 s p 1))
