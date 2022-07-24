; chrd (rd)
(mixFill
 5
 (lambda (_)
   (let* ((m (Mce6 60 65 72 77 79 84))
          (ds 3)
          (d (asMce (map (lambda (x) (* x ds)) (list 5 4 5 7 4 5))))
          (l (XLine m (Add m (Rand 0.05 0.5)) d doNothing))
          (f (MidiCps l))
          (z (envTrapezoid 0 (Rand 0.15 0.35) d (Rand 0.005 0.01)))
          (e (EnvGen 1 1 0 1 doNothing z))
          (p (XLine (Rand -1 1) (Rand -1 1) d doNothing))
          (o (FSinOsc f 0)))
     (Mix (Pan2 o p e)))))
