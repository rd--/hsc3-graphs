; buf-rd
(let* ((b (ctl kr "buf" 0))
       (phase (add (lf-tri ar 0.1 0)
                   (mul (lf-tri ar 0.23 0) (buf-frames ir b)))))
  (buf-rd-l 1 ar b phase 0))
