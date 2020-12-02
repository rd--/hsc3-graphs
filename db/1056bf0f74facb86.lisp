; neg
(let ((s (sin-osc ar 440 0)))
  (mce2 (mul s 0.1)
        (add s (neg s))))
