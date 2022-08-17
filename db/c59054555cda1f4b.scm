; lf pulses (rd)
(let* ((n0 (LFNoise0 (Mce2 20 40)))
       (n1 (LFNoise0 (Mce2 5 10)))
       (x (MouseX 0.012 0.19 1 0.1))
       (f (Formlet (Blip 10 12) (MulAdd n0 43 700) 0.005 x))
       (o (Mul (SinOsc 40 0) n1)))
  (Clip2 (LeakDC (Mul (Add f o) (Line 0  0.5 2.5 doNothing)) 0.995) 0.75))
