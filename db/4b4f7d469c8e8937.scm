; pulsecount
(let ((f (Mul (PulseCount (Impulse 10 0) (Impulse 0.4 0)) 200)))
 (Mul (SinOsc f 0) 0.05))
