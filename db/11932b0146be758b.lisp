; play-buf ; sine wave control of playback rate, negative rate plays backwards
(let ((b (ctl kr "buf" 0))
      (r (mul-add (f-sin-osc kr (x-line kr 0.2 8 30 remove-synth) 0) 3 0.6)))
 (play-buf 1 ar b (mul (buf-rate-scale kr b) r) 1 0 1 0))
