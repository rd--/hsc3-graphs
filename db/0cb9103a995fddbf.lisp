; tap ; use headphones
(let* ((b (clear-buf (local-buf 1 48000))) ; sample-rate ; one second
       (src (sound-in 0))
       (put (buf-wr b (phasor ar 0 1 0 (buf-frames kr b) 1) loop src))
       (get (tap 1 ar b (mce2 0.1 0.9))))
  (mrg2 get put))
