; Phasor ; control sine frequency, end frequency matches a second sine wave
(let* ((r (MouseX kr 0.2 2 1 0.1))
       (t (Impulse ar r 0))
       (x (Phasor ar t (FDiv r SampleRate) 0 1 0))
       (f (mce2 (lin-lin x 0 1 600 1000) 1000)))
  (Mul (SinOsc ar f 0) 0.1))
