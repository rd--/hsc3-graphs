; CoinGate
(let ((f (TRand 300 400 (CoinGate 0.8 (Impulse kr 10 0)))))
 (Mul (SinOsc ar f 0) 0.1))
