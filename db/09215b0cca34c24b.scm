; https://twitter.com/redFrik/status/1138498427241861122 (f0)
(let* ((f (Sqrt 9))
       (b f) ; (mce2 f 9.999)
       (d (Max (SinOscFB ar (FDiv b 99) 0) 0))
       (t1 (ugen-if (GT (SinOscFB ar (SinOscFB ar (FDiv 9 999) 0) 0) (SinOscFB ar (FDiv 9 99) 0)) f (FDiv 9 b)))
       (t2 (ugen-if (LT (SinOscFB ar (FDiv 9 99) 0) (SinOscFB ar (FDiv 99 9999) 0)) (FDiv b 9) f))
       (f1 (Lag (Mul (Mul (Mul 9.9 b) t1) t2) 0.1))
       (s1 (Mul (Mul (SinOscFB ar f1 d) (SinOscFB ar (FDiv b 9) 0)) d))
       (c (PitchShift s1 (FDiv 9 b) (FDiv 9 (Sqrt b)) (FDiv b 999) (FDiv b 99)))
       (s2 (GVerb (Mul (Mul (Mul c d) d) d) 99 9 (FDiv 9 999) 0.5 15 1 0.7 0.5 300))
       (s3 (Add (FDiv s2 9) (PitchShift c (FDiv f 9) (FDiv f 9) 0 0))))
  (mix (mce-transpose (FDiv (HPF (splay s3 1 1 0 #t) 9) 9))))