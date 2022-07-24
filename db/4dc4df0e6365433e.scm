; SendTrig ; see /notify to receive
(let ((s (LFNoise0 10)))
 (Mrg2 (Mul (SinOsc (MulAdd s 200 500) 0) 0.1)
       (SendTrig s 0 s)))
