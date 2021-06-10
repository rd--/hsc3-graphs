; SinOsc ; modulate freq
(let* ((f1 (XLine kr 1 1000 9 removeSynth))
       (f2 (MulAdd (SinOsc ar f1 0) 200 800)))
  (Mul (SinOsc ar f2 0) 0.1))
