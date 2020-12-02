; sweep ; backwards with variable offset
(let* ((b (ctl kr "buf" 0))
       (t (impulse ar (mouse-x kr 0.5 10 1 0.1) 0))
       (r (buf-sample-rate ir b))
       (i (add (sweep t (neg r)) (mul (buf-frames ir b) (lf-noise0 kr 15)))))
  (mul (buf-rd 1 ar b i 0 2) 0.5))
