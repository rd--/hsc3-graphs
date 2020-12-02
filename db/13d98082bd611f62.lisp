; peak-follower ; follow sine lfo
(let* ((x (mouse-x kr 0.99 1.0001 1 0.1))
       (s (sin-osc kr 0.2 0))
       (f (mul-add (peak-follower s (u:min x 1.0)) 200 500)))
  (mul (sin-osc ar f 0) 0.1))
