; CoinGate
(let* ((p 0.2)
       (t (Mul (Impulse 20 0) (Add (SinOsc 0.5 0) 1)))
       (t* (TExpRand (Mce2 1000 1000) 12000 t))
       (i (lambda () (CoinGate (Add p (Rand 0 0.1)) (Mul t 0.1))))
       (s (lambda () (Ringz (i) t* 0.01))))
 (!+ s 3))
