; http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0) ; slow to start
(letrec ((fib (lambda (n) (if (<= n 2) 1 (+ (fib (- n 1)) (fib (- n 2)))))))
  (let* ((s (map fib (to 1 16)))
         (n (map (lambda (x) (Mul (Mod x 8) 99)) s))
         (p (Dseq inf (Dshuf 8 n)))
         (q (CombN (Duty 1/8 0 doNothing p) 4 4 16))
         (o (Div (LfTri q 0) 4))
         (f (MulAdd (LfTri 1/16 0) 2000 3000)))
  (Pan2 (MoogFf o f 2 0) 0 0.5)))
