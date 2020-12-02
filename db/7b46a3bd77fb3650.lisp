; peak-follower ; mouse-x controls decay
(let* ((x (mouse-x kr 0.99 1.0001 1 0.1))
       (s (mul (dust ar 20) (line kr 0 1 4 do-nothing)))
       (f (mul-add (peak-follower s (u:min x 1.0)) 1500 200)))
  (mul (sin-osc ar f 0) 0.1))
