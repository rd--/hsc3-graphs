; moto rev (jmcc) #1
(let* ((f (MulAdd (SinOsc 0.2 0) 10 21))
       (s (LfPulse f (Mce2 0 0.1) 0.1)))
  (Clip2 (Rlpf s 100 0.1) 0.4))
