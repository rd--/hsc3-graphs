; feedr (rd) ; warning: input/output feedback loop
(let*
  ((delay-wr
    (lambda (b in)
      (RecordBuf ar b 0 1 0 1 loop 0 do-nothing in)))
   (tap
    (lambda (nc b delay-time)
      (PlayBuf nc ar b 1 0 (Mul delay-time (Neg SampleRate)) 1 do-nothing)))
   (feedr
    (lambda (b dl nc ch)
      (let* ((n 18)
             (t (replicateM n (lambda () (Rand 0.0 dl))))
             (g (replicateM n (lambda () (Rand 0.4 1.0))))
             (f (replicateM n (lambda () (Rand 0.9 0.95))))
             (d (zipWith
                 (lambda (t g)
                   (Mul (tap nc b t) g))
                 t g))
             (x (MouseX kr 0.02 1.0 1 0.1)))
        (make-mrg
         (Out 0 (Clip2 (LeakDC (HPF (foldl1 Add d) 20) 0.995) 1))
         (delay-wr b (foldl Add
                            (sound-in ch)
                            (map
                             (lambda (e)
                               (Mul e x))
                             (zipWith Mul d f)))))))))
  (feedr (ClearBuf (LocalBuf 2 (* 6 48000))) 6 2 (mce2 0 1)))
