; sweep ; raising rate
(let* ((b (ctl kr "buf" 0))
       (t (impulse ar (mouse-x kr 0.5 10 1 0.1) 0))
       (r (add (sweep t 2) 0.5))
       (i (sweep t (mul (buf-sample-rate ir b) r))))
  (mul (buf-rd 1 ar b i 0 2) 0.25))
