; t-delay
(let* ((s (mul (sin-osc ar 440 0) 0.1))
       (z (impulse ar 2 0))
       (l (mul z 0.1))
       (r (mul (toggle-ff (t-delay z 0.5)) s)))
  (mce2 l r))
