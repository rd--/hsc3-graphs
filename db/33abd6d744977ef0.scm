; DC ; offset ; cf. leakdc
(let ((o (Add (Mul (SinOsc ar 110 0) 0.1) (DC ar 0.5)))) (mce2 o (LeakDC o 0.995)))
