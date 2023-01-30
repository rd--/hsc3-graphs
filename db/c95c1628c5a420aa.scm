; Sweep ; raising rate ; requires=buf
(let* ((b (ctl "buf" 0))
       (t (Impulse (MouseX 0.5 10 1 0.1) 0))
       (r (Add (Sweep t 2) 0.5))
       (i (Sweep t (Mul (BufSampleRate b) r))))
  (Mul (BufRd 1 b i 0 2) 0.25))
