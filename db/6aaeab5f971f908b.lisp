; radians-per-sample
(let* ((sr 48000) (sd (/ 1 48000)) (rps (* sd two-pi)))
  (mul (sin-osc ar (f-div (recip rps) two-pi) 0) 0.05))
