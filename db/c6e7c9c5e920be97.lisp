; play-buf ; trigger playback at each pulse (diminishing intervals)
(let ((b (ctl kr "buf" 0))
      (t (impulse kr (x-line kr 0.1 100 10 remove-synth) 0)))
  (play-buf 1 ar b (buf-rate-scale kr b) t 0 0 0))
