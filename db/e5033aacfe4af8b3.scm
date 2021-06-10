; http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0) ; slow to start
(letrec ((fib (lambda (n) (if (<= n 2) 1 (+ (fib (- n 1)) (fib (- n 2)))))))
  (let* ((s (map fib (enumFromTo 1 16)))
         (n (map (compose (lambda (x) (* x 99)) (lambda (x) (mod x 8))) s))
         (p (Dseq dinf (Dshuf 8 (asMce n))))
         (q (CombN (Duty ar 1/8 0 doNothing p) 4 4 16))
         (o (FDiv (LFTri ar q 0) 4))
         (f (MulAdd (LFTri kr 1/16 0) 2000.0 3000.0)))
  (Pan2 (MoogFF o f 2 0) 0 0.5)))
