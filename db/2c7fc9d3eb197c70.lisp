; freq-shift ; shifting a 100Hz tone by 1 Hz rising to 500Hz
(let ((i (sin-osc ar 100 0))
      (s (x-line kr 1 500 5 remove-synth)))
  (mul (freq-shift i s 0) 0.1))
