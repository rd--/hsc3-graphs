; f0 <https://twitter.com/redFrik/status/1343283697840226307>
(let* ((b (FDiv (make-mce (enumFromTo 2 12)) 12))
       (f (make-mce (list 136.1 163.3 181.4 204.1 244.9 272.1 326.5 362.8 408.2 489.8 544.2)))
       (z (MulAdd (mce-fill 11 (lambda (z) (WhiteNoise ar))) (FDiv (Add (LFTri ar b 0) 1) 2) (BrownNoise ar)))
       (t (LFTri ar (Pow 121 (LFTri ar (Mul (FDiv 2 121) b) 0)) 0))
       (d (FDiv (MulAdd (FDiv (Lag2 (GT (FDiv 1 212) (LFTri ar (FDiv 1 212.1) 0)) (FDiv 2 b)) 12) 1.2 1.2) f))
       (p (Pluck z t (FDiv 2 121) d (FDiv (Mul (FDiv 1 2) 12) 1.2) (FDiv (Add (LFTri ar (FDiv b 12) 0) 1) 2))))
  (splay (HPF p 12) 1 (FDiv (FDiv 1 2.1) 2) 0 #t))
