; lf-pulse
(let ((f (mul-add (lf-pulse kr 3 0 0.3) 200 200)))
  (mul (lf-pulse ar f 0 0.2) 0.05))
