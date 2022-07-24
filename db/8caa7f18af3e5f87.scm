; Sweep ; Index into a buffer
(let* ((b (ctl "buf" 0))
       (t (Impulse (MouseX 0.5 20 1 0.1) 0))
       (i (Sweep t (BufSampleRate b))))
  (Mul (BufRd 1 b i 0 2) 0.25))
