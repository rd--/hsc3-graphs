; DC ; offset ; cf. leakdc
(let ((o (Add (Mul (SinOsc 110 0) 0.1) (DC 0.5)))) (Mce2 o (LeakDC o 0.995)))
