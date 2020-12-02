; buf-rd
(let* ((b (ctl kr "buf" 0))
       (phase (mul (lf-noise1 ar (mouse-x kr (mce2 5 10) 100 0 0.1))
                   (buf-frames ir b))))
  (buf-rd-l 1 ar b phase 0))
