; http://sccode.org/1-4Qy (f0) (requires -w 512) ; edited for packet size
(let* ((mean (lambda (l) (Div (Mix l) (length l))))
       (a (lambda (f p) (LfSaw f p)))
       (n 50)
       (z (lambda (i)
            (let* ((o1 (a (Div (+ i 1) (Mce2 3 4)) 0))
                   (o2 (Add (a (/ (+ i 1) 8) 0) 1))
                   (f0 (MulAdd (Gt o1 o2) (/ n 2) n))
                   (m (a (AddDiv i 1 n) (/ i (/ n 2))))
                   (o3 (Mul (Blip f0 (Add i (Mce2 2 3))) m)))
              (Ringz o3 (AddMul i 1 (MulAdd n 2 -1)) 0.1)))))
  (Div (mean (map z (toBy 0 n 2))) 10))
