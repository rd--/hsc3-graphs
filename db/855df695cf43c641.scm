; BufWr
(let* ((b (LocalBuf 1 (* 48000 2)))
       (o (Mul (SinOsc (MulAdd (LfNoise1 2) 300 400) 0) 0.1))
       (ph (lambda (rt) (Phasor 0 (Mul (BufRateScale b) rt) 0 (BufFrames b) 0)))
       (w (BufWr b (ph (MouseX 0.25 1 linear 0.2)) loop o))
       (r (BufRd 1 b (ph (MouseY 0.25 16 linear 0.2)) loop 1)))
  (Mrg2 r w))
