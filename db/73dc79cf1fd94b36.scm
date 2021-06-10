; lucier (cr) ; http://illposed.com/
(let* ((freq (ctl kr "freq" 60))
       (crr (Recip ControlRate))
       (mk-dt (lambda (f) (Sub (Recip f) crr)))
       (string-delay (mk-dt freq))
       (pk1-pos 0.1)
       (src-pos 0.3)
       (pk2-pos 0.9)
       (max-delay 1.0)
       (mk-delay (lambda (i r) (LPZ1 (DelayC i max-delay (Mul r string-delay)))))
       (mk-allpass (lambda (i r dt) (LPZ1 (AllpassC i max-delay (Mul r string-delay) dt))))
       (drv (LocalIn 1 ar 0))
       (pk1-r (let ((i drv) (r (Sub src-pos pk1-pos))) (mk-delay i r)))
       (pk1-l (let ((i (Mul pk1-r (negate 1)))
                    (r (Mul pk1-pos 2))
                    (dt (Rand 0.001 0.11)))
                (mk-allpass i r dt)))
       (pk2-l (let ((i pk1-l) (r (Sub pk2-pos pk1-pos))) (Mul (mk-delay i r) 0.99)))
       (string-l (let ((i pk2-l) (r (Sub 1.0 pk2-pos))) (mk-delay i r)))
       (pk2-r (let ((i (Mul string-l (negate 1)))
                    (r (Sub 1.0 pk2-pos))
                    (dt (Add 2 (Rand 0.001 0.11))))
                (Mul (mk-allpass i r dt) 0.99)))
       (string-r (let ((i pk2-r) (r (Sub pk2-pos src-pos))) (mk-delay i r)))
       (source (let* ((s (Mul (SinOsc ar 220 0) 0.01))
                      (p (Mul (Pulse ar (Add 60 (Mul (Amplitude kr drv 0.01 0.01) 11)) 0.5) 0.1))
                      (f (RLPF (Add s p) 320 0.05)) (e (Sub 1.0 (Min (Amplitude kr drv 0.01 0.01) 1.0))))
                 (Mul (Normalizer f 0.7 0.01) e)))
       (l-out (LocalOut (Add (Mul source 0.2) string-r)))
       (out-l (Add pk1-l pk1-r)) (out-r (Add pk2-l pk2-r)))
  (Mrg (list (Mce2 out-l out-r) drv source l-out)))
