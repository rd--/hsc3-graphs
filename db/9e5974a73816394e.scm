; f0 <https://twitter.com/redFrik/status/1343283697840226307>
(let ((b 'undefined) (f 'undefined) (z 'undefined) (t 'undefined) (d 'undefined) (c 'undefined) (p 'undefined))
  (set! b (Fdiv (enumFromTo 2 12) 12))
  (set! f '(136.1 163.3 181.4 204.1 244.9 272.1 326.5 362.8 408.2 489.8 544.2))
  (set! z (Add (Mul (mceFill 11 (lambda (_) (let () (WhiteNoise)))) (Fdiv (Add (LFTri b 0) 1) 2)) (BrownNoise)))
  (set! t (LFTri (Pow 121 (LFTri (Mul (Fdiv 2 121) b) 0)) 0))
  (set! d (Fdiv (Add (Mul (Fdiv (Lag2 (Le (LFTri (Fdiv 1 212.1) 0) (Fdiv 1 212)) (Fdiv 2 b)) 12) 1.2) 1.2) f))
  (set! c (Fdiv (Add (LFTri (Fdiv b 12) 0) 1) 2))
  (set! p (Pluck z t (Fdiv 2 121) d (Fdiv (Mul (Fdiv 1 2) 12) 1.2) c))
  (Fdiv (Fdiv (Splay2 (HPF p 12)) 2.1) 2))