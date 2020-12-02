; buf-rd ; phasor index
(let* ((b (ctl kr "buf" 0))
       (phase (phasor ar
                      0
                      (mul (mouse-x kr 0.5 2 0 0.1) (buf-rate-scale kr b))
                      0
                      (buf-frames kr b)
                      0)))
  (buf-rd 1 ar b phase 1 (mouse-y kr 0 5 0 0.1)))
