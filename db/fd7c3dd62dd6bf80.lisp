; feedr (rd) ; warning: input/output feedback loop
(let*
  ((delay-wr
    (lambda (b in)
      (record-buf ar b 0 1 0 1 loop 0 do-nothing in)))
   (tap
    (lambda (nc b delay-time)
      (play-buf nc ar b 1 0 (mul delay-time (neg sample-rate)) 1 do-nothing)))
   (feedr
    (lambda (b dl nc ch)
      (let* ((n 18)
             (t (replicate-m n (lambda () (rand 0.0 dl))))
             (g (replicate-m n (lambda () (rand 0.4 1.0))))
             (f (replicate-m n (lambda () (rand 0.9 0.95))))
             (d (zip-with
                 (lambda (t g)
                   (mul (tap nc b t) g))
                 t g))
             (x (mouse-x kr 0.02 1.0 1 0.1)))
        (make-mrg
         (out 0 (clip2 (leak-dc (hpf (foldl1 add d) 20) 0.995) 1))
         (delay-wr b (foldl add
                            (sound-in ch)
                            (map
                             (lambda (e)
                               (mul e x))
                             (zip-with mul d f)))))))))
  (feedr (clear-buf (local-buf 2 (* 6 48000))) 6 2 (mce2 0 1)))
