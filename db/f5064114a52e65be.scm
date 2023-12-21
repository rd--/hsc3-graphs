; f0 ; https://twitter.com/redFrik/status/1210118661022867458
(let* ((b (map (lambda (x) (/ 1 x)) (to 2 7)))
       (d (/ 1 48))
       (g (cos (cos 0)))
       (l (list 0 -16 0 -16 0 0 -16 0   -16 0 -16 0 0 0 -16 -16  47 0 -16
                0 -16 0 -16 0 0 -16 0 0 -16 0   0 0 0 0  -5 -16 -16   -15))
       (f (Duty b 0 doNothing (Dseq inf (map (lambda (x) (+ x 48)) l))))
       (o (Mul (SinOscFb f (Max (SinOsc d 0) 0)) (sin (cos 0))))
       (c (SinOsc 0 (Pow pi o)))
       (p (Mul (PitchShift c g (to 2 7) d d) b)))
  (Mul (LeakDc (Splay2 (Add c p)) 0.995) g))
