; runningsum
(let ((n 40))
  (foldl1 Mul (list (SinOsc ar 440 0)
                    (RunningSum (sound-in (mce2 0 1)) n)
                    (Recip n))))
