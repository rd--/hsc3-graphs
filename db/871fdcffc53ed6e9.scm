; Gendy1 ; used as an lfo
(let* ((ad (MulAdd (SinOsc 0.1 0) 0.49 0.51))
       (dd (MulAdd (SinOsc 0.13 0) 0.49 0.51))
       (as (MulAdd (SinOsc 0.17 0) 0.49 0.51))
       (ds (MulAdd (SinOsc 0.19 0) 0.49 0.51))
       (g  (Gendy1 2 4 ad dd 3.4 3.5 as ds 10 10)))
  (Pan2 (SinOsc (MulAdd g 50 350) 0) 0.0 0.1))
