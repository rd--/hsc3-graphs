; play-buf ; trigger playback at each pulse
(let ((b (ctl kr "buf" 0)))
  (play-buf 1 ar b (buf-rate-scale kr b) (impulse kr 2 0) 0 no-loop do-nothing))
