; lpf
(let ((f (x-line kr 0.7 300 20 remove-synth)))
  (lpf (mul (saw ar 200) 0.1)
       (mul-add (f-sin-osc kr f 0) 3600 4000)))
