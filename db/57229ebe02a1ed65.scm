; CoinGate
(let ((f (TRand 300 400 (CoinGate 0.8 (Impulse 10 0)))))
  (Mul (SinOsc f 0) 0.1))
