; Amplitude
(let* ((a (Amplitude kr (SoundIn 0) 0.01 0.01))
       (f (MulAdd a 1200 400)))
  (Mul (SinOsc ar f 0) 0.1))
