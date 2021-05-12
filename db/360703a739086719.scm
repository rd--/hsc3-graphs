; police state (jmcc) #2
(let* ((mk-node
        (lambda (_)
          (let* ((r0 (Rand 0.02 0.1))
                 (r1 (Rand 0 (* pi 2)))
                 (r2 (Rand 0 600))
                 (r3 (Rand 700 1300))
                 (r4 (Rand -1 1))
                 (r5 (Rand 80 120))
                 (n0 (LFNoise2 ar r5))
                 (f (MulAdd (SinOsc kr r0 r1) r2 r3)))
            (Pan2 (Mul (SinOsc ar f 0) n0) r4 0.1))))
       (n0 (LFNoise2 kr (mce2 0.4 0.4)))
       (n1 (LFNoise2 ar (MulAdd n0 90 620)))
       (n2 (LFNoise2 kr (mce2 0.3 0.3)))
       (e (Mul n1 (MulAdd n2 0.15 0.18))))
  (CombL (Add (mix-fill 4 mk-node) e) 0.3 0.3 3))
