; Gendy1 ; another traffic moment
(let* ((i 10)
       (x (MouseX 100 2000 0 0.1))
       (y (MouseY 0.01 1.0 0 0.1))
       (b (MouseButton 0 1 0.1))
       (z (mixFill
           i
           (lambda (_)
             (let* ((f (Rand 50 560.3))
                    (n (Rand 2 20))
                    (k (MulAdd (SinOsc (ExpRand 0.02 0.2) 0)
                                (Fdiv n 2)
                                (Fdiv n 2)))
                    (g (Gendy1
                               (Rand 0 6) (Rand 0 6) (Rand 0 1) (Rand 0 1) f f
                               (Rand 0 1) (Rand 0 1) n k)))
               (Pan2 g (Rand -1 1) (Fdiv 0.1 (sqrt i))))))))
  (Add (Mul b z) (Mul (Sub 1 b) (Resonz z x y))))
