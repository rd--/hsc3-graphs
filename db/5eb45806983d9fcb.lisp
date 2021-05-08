; BufRd ; Phasor index
(let* ((b (ctl kr "buf" 0))
       (phase (Phasor ar
                      0
                      (Mul (MouseX kr 0.5 2 0 0.1) (BufRateScale kr b))
                      0
                      (BufFrames kr b)
                      0)))
  (BufRd 1 ar b phase 1 (MouseY kr 0 5 0 0.1)))
