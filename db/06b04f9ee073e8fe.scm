; env ; plain envelope data representation ; levels, times, curves, release-node, loop-node
(let ((t (Dust 1))
      (d (env (list 0 0.2 0) (list 0 2) (list -4 -4) -1 -1)))
  (Mul (SinOsc 440 0) (EnvGen t 1 0 1 doNothing d)))
