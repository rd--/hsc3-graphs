; Sweep ; backwards with variable offset
(let* ((b (ctl kr "buf" 0))
       (t (Impulse ar (MouseX kr 0.5 10 1 0.1) 0))
       (r (BufSampleRate ir b))
       (i (Add (Sweep t (Neg r)) (Mul (BufFrames ir b) (LFNoise0 kr 15)))))
  (Mul (BufRd 1 ar b i 0 2) 0.5))
