; InTrig ; run an oscillator reading trigger at bus=10 ; run control signal writing to bus=10
(let* ((k 10)
       (t (InTrig 1 k))
       (p (EnvPerc 0.01 1 1 (list -4 -4)))
       (e (EnvGen t t 0 1 doNothing p))
       (f (MulAdd (Latch t t) 440 880)))
  (Mrg2
   (Mul (SinOsc f 0) e)
   (ControlOut k (Mul (kr: (Impulse (MouseX 1 7 0 0.2) 0)) 0.1))))
