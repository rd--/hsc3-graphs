; play-buf ; play once
(let ((b (ctl kr "buf" 0))) (play-buf 1 ar b (buf-rate-scale kr b) 1 0 no-loop do-nothing))
