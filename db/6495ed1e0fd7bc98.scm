; BufRd ; Phasor index ; requires=buf
(let* ((b (ctl "buf" 0))
       (phase (Phasor
                      0
                      (Mul (MouseX 0.5 2 0 0.1) (BufRateScale b))
                      0
                      (BufFrames b)
                      0)))
  (BufRd 1 b phase 1 (MouseY 0 5 0 0.1)))
