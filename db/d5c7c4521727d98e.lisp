; gendy1 ; wasp
(let ((ad (mul-add (sin-osc kr 0.1 0) 0.1 0.9)))
  (pan2 (gendy1 ar 0 0 ad 1.0 50 1000 1 0.005 12 12) 0.0 0.1))
