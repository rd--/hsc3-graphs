; rand2
(let* ((a (Line kr 0.1 0 0.1 remove-synth))
       (p (Rand2 1))
       (s (Mul (FSinOsc ar (Rand 200 1200) 0) a)))
 (Pan2 s p 1))
