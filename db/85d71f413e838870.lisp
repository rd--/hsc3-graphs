; amplitude
(let* ((a (Amplitude (AR (SoundIn 0)) 0.01 0.01))
       (f (MulAdd a 1200 400)))
  (Mul (SinOsc (KR f) 0) 0.1))
