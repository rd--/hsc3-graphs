; f0 <https://twitter.com/redFrik/status/1343283697840226307>
(let* ((b (FDiv (mceFromTo 2 12) 12))
       (f (asMce (list 136.1 163.3 181.4 204.1 244.9 272.1 326.5 362.8 408.2 489.8 544.2)))
       (z (MulAdd (mceFill 11 (lambda (z) (WhiteNoise ar))) (AddDiv (LFTri ar b 0) 1 2) (BrownNoise ar)))
       (t (LFTri ar (Pow 121 (LFTri ar (Mul 2/121 b) 0)) 0))
       (d (FDiv (MulAdd (FDiv (Lag2 (GT 1/212 (LFTri ar (/ 1 212.1) 0)) (FDiv 2 b)) 12) 1.2 1.2) f))
       (p (Pluck z t 2/121 d (/ (* 1/2 12) 1.2) (AddDiv (LFTri ar (FDiv b 12) 0) 1 2))))
  (Splay (HPF p 12) 1 (/ (/ 1 2.1) 2) 0 #t))
