; Phasor ; control sine frequency, end frequency matches a second sine wave
(let* ((r (MouseX 0.2 2 1 0.1))
       (t (Impulse r 0))
       (x (Phasor t (Div r (SampleRate)) 0 1 0))
       (f (Mce2 (LinLin x 0 1 600 1000) 1000)))
  (Mul (SinOsc f 0) 0.1))
