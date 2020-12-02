; peak-follower ; a little decay
(let* ((s (mul (dust ar 20) (line kr 0 1 4 do-nothing)))
       (f (mul-add (peak-follower s 0.999) 1500 200)))
  (mul (sin-osc ar f 0) 0.1))
