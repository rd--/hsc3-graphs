; Gendy1 ; another traffic moment
(let* ((i 10)
       (x (MouseX kr 100 2000 0 0.1))
       (y (MouseY kr 0.01 1.0 0 0.1))
       (b (MouseButton kr 0 1 0.1))
       (z (mix-fill
           i
           (lambda (_)
             (let* ((f (Rand 50 560.3))
                    (n (Rand 2 20))
                    (k (MulAdd (SinOsc kr (ExpRand 0.02 0.2) 0)
                                (FDiv n 2)
                                (FDiv n 2)))
                    (g (Gendy1 ar
                               (Rand 0 6) (Rand 0 6) (Rand 0 1) (Rand 0 1) f f
                               (Rand 0 1) (Rand 0 1) n k)))
               (Pan2 g (Rand -1 1) (FDiv 0.1 (sqrt i))))))))
  (Add (Mul b z) (Mul (Sub 1 b) (Resonz z x y))))
