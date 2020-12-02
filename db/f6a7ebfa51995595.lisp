; running-sum
(let ((n 40))
  (foldl1 mul (list (sin-osc ar 440 0)
                    (running-sum (sound-in (mce2 0 1)) n)
                    (recip n))))
