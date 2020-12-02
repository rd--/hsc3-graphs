; gendy1 ; Use sinus to track any oscillator and take CP positions from it ; use adparam and ddparam as the inputs to sample
(let* ((p (lf-pulse kr 100 0 0.4))
       (s (mul (sin-osc kr 30 0) 0.5))
       (g (gendy1 ar 6 6 p s 440 660 0.5 0.5 12 12)))
  (pan2 g 0.0 0.1))
