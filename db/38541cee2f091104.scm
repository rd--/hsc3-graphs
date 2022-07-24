; pulsing bottles (jmcc) #2
(mixFill
 6
 (lambda (_)
   (let* ((n (WhiteNoise))
          (r0 (Rand 4 14))
          (r1 (Rand 0 0.7))
          (r2 (Rand 400 7400))
          (r (Resonz (Mul3 n (LFPulse r0 0 0.25) r1) r2 0.01))
          (f (Rand 0.1 0.5))
          (p (Rand 0 (Mul pi 2)))
          (s (SinOsc f p)))
     (Pan2 r s 1))))
