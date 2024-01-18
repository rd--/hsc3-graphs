; TDelay
(let* ((s (Mul (SinOsc 440 0) 0.1))
       (z (Impulse 2 0))
       (l (Mul z 0.1))
       (r (Mul (ToggleFf (TDelay z 0.5)) s)))
  (Mce2 l r))
