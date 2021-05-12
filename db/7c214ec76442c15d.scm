; SendTrig ; see /notify to receive
(let ((s (LFNoise0 kr 10)))
 (mrg2 (Mul (SinOsc ar (MulAdd s 200 500) 0) 0.1)
       (SendTrig s 0 s)))
