; lf-saw ; used as both oscillator and lfo
(let ((f (mul-add (lf-saw kr 4 0) 400 400)))
  (mul (lf-saw ar f 0) 0.1))
