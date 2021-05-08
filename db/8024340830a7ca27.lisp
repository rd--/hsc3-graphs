; Sweep ; raising rate
(let* ((b (ctl kr "buf" 0))
       (t (Impulse ar (MouseX kr 0.5 10 1 0.1) 0))
       (r (Add (Sweep t 2) 0.5))
       (i (Sweep t (Mul (BufSampleRate ir b) r))))
  (Mul (BufRd 1 ar b i 0 2) 0.25))
