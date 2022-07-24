; Amplitude
(let* ((a (Amplitude (SoundIn 0) 0.01 0.01))
       (f (MulAdd a 1200 400)))
  (Mul (SinOsc f 0) 0.1))
