; deep-trip (jmcc) #9 ; texture=overlap,4,12,4,inf
(let* ((f (MidiCps (MulAdd (LfNoise1 (Rand 0 0.3)) 60 70)))
       (a (Mul (LfNoise2 (Mul f (Rand 0 0.5))) (Max 0 (Mul3 (LfNoise1 (Rand 0 8)) (SinOsc (Rand 0 40) 0) 0.1))))
       (z (Mul (SinOsc f 0) a))
       (s (Pan2 z (LfNoise1 (Rand 0 5)) 1))
       (c (lambda () (CombN s 0.5 (RandN 2 0.3 0.5) 20))))
  (Add3 s (c) (c)))
