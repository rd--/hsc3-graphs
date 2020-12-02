; sweep ; index into a buffer
(let* ((b (ctl kr "buf" 0))
       (t (impulse ar (mouse-x kr 0.5 20 1 0.1) 0))
       (i (sweep t (buf-sample-rate ir b))))
  (mul (buf-rd 1 ar b i 0 2) 0.25))
