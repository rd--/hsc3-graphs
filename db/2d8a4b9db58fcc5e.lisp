; InTrig ; run an oscillator reading trigger at bus=10 ; run control signal writing to bus=10
(let* ((k 10)
       (t (InTrig 1 k))
       (p (env-perc 0.01 1 1 (list -4 -4)))
       (e (EnvGen kr t t 0 1 do-nothing p))
       (f (MulAdd (Latch t t) 440 880)))
  (mrg2 (Mul (SinOsc ar f 0) e)
        (Out k (Mul (Impulse kr 1 0) 0.1))))
