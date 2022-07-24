; feedr (rd) ; warning: input/output feedback loop
(let*
  ((delayWrite
    (lambda (b in)
      (RecordBuf b 0 1 0 1 loop 0 doNothing in)))
   (delayTap
    (lambda (nc b delayTime)
      (PlayBuf nc b 1 0 (Mul delayTime (Neg (SampleRate))) 1 doNothing)))
   (feedr
    (lambda (b dl nc ch)
      (let* ((n 18)
             (t (replicateM n (lambda () (Rand 0.0 dl))))
             (g (replicateM n (lambda () (Rand 0.4 1.0))))
             (f (replicateM n (lambda () (Rand 0.9 0.95))))
             (d (zipWith
                 (lambda (t g)
                   (Mul (delayTap nc b t) g))
                 t g))
             (x (MouseX 0.02 1.0 1 0.1)))
        (Mrg2
         (Out 0 (Clip2 (LeakDC (HPF (foldl1 Add d) 20) 0.995) 1))
         (delayWrite b (foldl Add
                              (SoundIn ch)
                              (map
                               (lambda (e)
                                 (Mul e x))
                               (zipWith Mul d f)))))))))
  (feedr (ClearBuf (LocalBuf 2 (* 6 48000))) 6 2 (Mce2 0 1)))
