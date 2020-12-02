; freq-shift ; shifting a complex tone by 1 Hz rising to 500Hz
(let ((i (klang ar 1 0 (klang-data (list 101 303 606 808)
				   (replicate 4 1)
				   (replicate 4 1))))
      (s (x-line kr 1 500 5 remove-synth)))
  (mul (freq-shift i s 0) 0.1))
