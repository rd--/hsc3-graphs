; schmidt
(let* ((in (lf-noise1 kr 3))
       (octave (add (schmidt in -0.15 0.15) 1))
       (f (add (mul in 200) (mul 500 octave))))
  (mul (sin-osc ar f 0) 0.1))
