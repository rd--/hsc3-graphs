; freq-shift ; shifting bandpassed noise
(let ((i (bpf (white-noise ar) 1000 0.001))
      (s (mul (lf-noise0 ar 5.5) 1000)))
  (mul (freq-shift i s 0) 32))
