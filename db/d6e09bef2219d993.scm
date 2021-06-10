; BufWr
(let* ((b (LocalBuf 1 (* 48000 2)))
       (o (Mul (SinOsc ar (MulAdd (LFNoise1 kr 2) 300 400) 0) 0.1))
       (ph (lambda (rt) (Phasor ar 0 (Mul (BufRateScale kr b) rt) 0 (BufFrames kr b) 0)))
       (w (BufWr b (ph (MouseX kr 0.25 1 linear 0.2)) loop o))
       (r (BufRd 1 ar b (ph (MouseY kr 0.25 16 linear 0.2)) loop 1)))
  (Mrg2 r w))
