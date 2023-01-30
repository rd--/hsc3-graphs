; Gt ; greater than ; c.f. Eq (equal to) ; trigger an envelope
(Mul3 (SinOsc 440 0) (EnvGen (Gt (SinOsc 1 0) 0) 1 0 1 doNothing (EnvPerc 0.01 1 1 -4)) 0.1)
