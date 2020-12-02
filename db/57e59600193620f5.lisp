; lz-bf (rd) ; requires=buf
(let*
  ((b (ctl kr "buf" 0))
   (x (mouse-x kr 1 12 0 0.1))
   (l (lorenz-l ar
                sample-rate
                (mul-add (lf-noise0 kr x) 2 12)
                (mul-add (lf-noise0 kr x) 20 38)
                (mul-add (lf-noise0 kr x) 1.5 3)
                (mce2 0.025 0.05)
                0.1 0.0 0.0))
   (p (phasor ar
              0
              (mul3 l 24 (buf-rate-scale kr b))
              0
              (buf-frames kr b) 0)))
  (buf-rd 1 ar b p 0 2))
