; saucer base (jmcc) ; texture=overlap,2,6,4,inf
(let* ((b (Rand 0 1000))
       (c (Rand 0 5000))
       (o (Add (Mul (SinOsc ar (Rand 0 20) 0) b) (Mul 1.1 b)))
       (p (Add (Mul (SinOsc ar o 0) c) (Mul 1.1 c))))
  (Pan2 (Mul (SinOsc ar p 0) 0.1) (Rand -1 1) 1))
