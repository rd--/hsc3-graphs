; Sweep ; Index into a buffer
(let* ((b (ctl kr "buf" 0))
       (t (Impulse ar (MouseX kr 0.5 20 1 0.1) 0))
       (i (Sweep t (BufSampleRate ir b))))
  (Mul (BufRd 1 ar b i 0 2) 0.25))
