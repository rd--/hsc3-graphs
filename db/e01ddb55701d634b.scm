; http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0)
(let* ((a (lambda (i j k l) (MulAdd (SinOsc ar i j) k l)))
       (f (a (a 0.11 0 1 0) 0 1 0))
       (pf (a (Mul 95 (a 0.01 0 1 1)) 0 (a 0.005 0 50 0) 100))
       (p (a pf (a (Mce2 98 97) 0 1 0) (Add pi (a 0.0005 0 1 0)) 0)))
  (Mul (TanH (a f p 1 0)) 0.1))