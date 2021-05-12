; pulsecount
(let ((f (Mul (PulseCount (Impulse ar 10 0) (Impulse ar 0.4 0)) 200)))
 (Mul (SinOsc ar f 0) 0.05))
