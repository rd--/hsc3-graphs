; sos ; same as two-pole
(let* ((theta (line kr (* 0.2 pi) pi 5 remove-synth))
       (rho (line kr 0.6 0.99 5 do-nothing))
       (b1 (mul 2 (mul rho (u:cos theta))))
       (b2 (neg (squared rho))))
  (sos (mul (lf-saw ar 200 0) 0.05) 1 0 0 b1 b2))
