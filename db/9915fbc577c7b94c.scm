; Gendy1 ; Use sinus to track any oscillator and take CP positions from it ; use adparam and ddparam as the inputs to sample
(let* ((p (LFPulse 100 0 0.4))
       (s (Mul (SinOsc 30 0) 0.5))
       (g (Gendy1 6 6 p s 440 660 0.5 0.5 12 12)))
  (Pan2 g 0.0 0.1))
