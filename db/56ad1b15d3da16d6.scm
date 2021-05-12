; analog bubbles (jmcc) #1
(let* ((o (MulAdd (LFSaw kr (mce2 8 7.23) 0) 3 80))
       (f (MulAdd (LFSaw kr 0.4 0) 24 o))
       (s (Mul (SinOsc ar (MIDICPS f) 0) 0.04)))
  (CombN s 0.2 0.2 4))
