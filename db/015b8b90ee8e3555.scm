; theremin (jmcc)
(let* ((mod 7)
       (detune 0)
       (x (MouseX 0 0.9 0 0.2))
       (y (MouseY 4000 200 1 0.8))
       (f (Add y detune))
       (f* (Add f (Mul3 f (SinOsc mod 0) 0.02)))
       (a (Mul (SinOsc f* 0) x)))
  (Pan2 a 0 0.2))
