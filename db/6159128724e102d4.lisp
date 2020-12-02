; in-feedback ; resonator, see local-out for variant
(let* ((b (add num-input-buses num-output-buses))
       (p (in-feedback 1 b))
       (i (mul (impulse ar 1 0) 0.5))
       (d (delay-c (add i (mul p 0.995)) 1 (sub (recip 440) (recip control-rate)))))
  (mrg2 (offset-out b d) (offset-out 0 p)))
