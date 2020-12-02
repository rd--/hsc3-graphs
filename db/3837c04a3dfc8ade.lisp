; in-feedback ; evaluate these in either order and hear both tones
(let ((b (add num-input-buses num-output-buses)))
  (out 0 (in-feedback 1 b)))
