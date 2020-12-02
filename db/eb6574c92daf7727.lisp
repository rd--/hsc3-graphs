; buf-wr
(let* ((b (local-buf 1 (* 48000 2)))
       (o (mul (sin-osc ar (mul-add (lf-noise1 kr 2) 300 400) 0) 0.1))
       (ph (lambda (rt) (phasor ar 0 (mul (buf-rate-scale kr b) rt) 0 (buf-frames kr b) 0)))
       (w (buf-wr b (ph (mouse-x kr 0.25 1 linear 0.2)) loop o))
       (r (buf-rd-l 1 ar b (ph (mouse-y kr 0.25 16 linear 0.2)) loop)))
  (mrg2 r w))
