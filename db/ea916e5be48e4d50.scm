; Sweep ; backwards with variable offset
(let* ((b (ctl "buf" 0))
       (t (Impulse (MouseX 0.5 10 1 0.1) 0))
       (r (BufSampleRate b))
       (i (Add (Sweep t (Neg r)) (Mul (BufFrames b) (LFNoise0 15)))))
  (Mul (BufRd 1 b i 0 2) 0.5))
