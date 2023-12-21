; f0 <https://twitter.com/redFrik/status/1343283697840226307>
(let* ((b (Div (to 2 12) 12))
       (f (list 136.1 163.3 181.4 204.1 244.9 272.1 326.5 362.8 408.2 489.8 544.2))
       (z (MulAdd (WhiteNoiseN 11) (AddDiv (LfTri b 0) 1 2) (BrownNoise)))
       (t (LfTri (Pow 121 (LfTri (Mul 2/121 b) 0)) 0))
       (d (Div (MulAdd (Div (Lag2 (Gt 1/212 (LfTri (/ 1 212.1) 0)) (Div 2 b)) 12) 1.2 1.2) f))
       (p (Pluck z t 2/121 d (/ (* 1/2 12) 1.2) (AddDiv (LfTri (Div b 12) 0) 1 2))))
  (Splay (Hpf p 12) 1 (/ (/ 1 2.1) 2) 0 #t))
