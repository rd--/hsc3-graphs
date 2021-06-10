; hpf
(let* ((i (Mul (Saw ar 200) 0.05))
       (f1 (XLine kr 0.7 300 20 doNothing))
       (f2 (MulAdd (FSinOsc kr f1 0) 3600 4000)))
  (Mul (HPF i f2) 5))
