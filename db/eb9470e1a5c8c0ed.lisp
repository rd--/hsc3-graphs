; buf-rd
(let ((b (ctl kr "buf" 0)))
  (buf-rd 1 ar b (mul (sin-osc ar 0.1 0) (buf-frames ir b)) 0 2))
