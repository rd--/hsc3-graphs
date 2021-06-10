; f0 ; https://twitter.com/redFrik/status/1210118661022867458
(let* ((b (asMce (map (lambda (x) (/ 1 x)) (enumFromTo 2 7))))
       (d (/ 1 48))
       (g (cos (cos 0)))
       (l (list 0 -16 0 -16 0 0 -16 0   -16 0 -16 0 0 0 -16 -16  47 0 -16
                0 -16 0 -16 0 0 -16 0 0 -16 0   0 0 0 0  -5 -16 -16   -15))
       (f (Duty ar b 0 doNothing (Dseq dinf (asMce (map (lambda (x) (+ x 48)) l)))))
       (o (Mul (SinOscFB ar f (Max (SinOsc ar d 0) 0)) (sin (cos 0))))
       (c (SinOsc ar 0 (Pow pi o)))
       (p (Mul (PitchShift c g (mceFromTo 2 7) d d) b)))
  (Mul (LeakDC (Splay (Add c p) 1 1 0 #t) 0.995) g))
