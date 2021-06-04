; theremin (jmcc)
(let* ((mod 7)
       (detune 0)
       (x (MouseX kr 0 0.9 0 0.2))
       (y (MouseY kr 4000 200 1 0.8))
       (f (Add y detune))
       (f* (Add f (mul3 f (SinOsc ar mod 0) 0.02)))
       (a (Mul (SinOsc ar f* 0) x)))
  (Pan2 a 0 0.2))