; lf-tri ; used as both oscillator and lfo
(let ((f (mul-add (lf-tri kr 4 0) 400 400)))
  (mul (lf-tri ar f 0) 0.1))
