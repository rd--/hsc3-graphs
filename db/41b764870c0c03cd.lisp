; play-buf ; infinite loop
(let ((b (ctl kr "buf" 0))) (play-buf 1 ar b (buf-rate-scale kr b) 1 0 loop do-nothing))
