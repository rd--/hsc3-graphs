; tdelay
(let* ((s (Mul (SinOsc ar 440 0) 0.1))
       (z (Impulse ar 2 0))
       (l (Mul z 0.1))
       (r (Mul (ToggleFF (TDelay z 0.5)) s)))
  (Mce2 l r))
