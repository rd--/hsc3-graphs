; in-feedback ; evaluate these in either order and hear both tones
(let ((b (add num-input-buses num-output-buses)))
  (mrg2 (out b (mul (sin-osc ar 440 0) 0.1))
        (out 0 (mul (sin-osc ar 660 0) 0.1))))
