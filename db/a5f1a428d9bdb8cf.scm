; rand2
(let* ((a (Line 0.1 0 0.1 removeSynth))
       (p (Rand2 1))
       (s (Mul (FSinOsc (Rand 200 1200) 0) a)))
 (Pan2 s p 1))
