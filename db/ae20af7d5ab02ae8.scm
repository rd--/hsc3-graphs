; as-local-buf ; combines LocalBuf and SetBuf
(let* ((b (as-local-buf (list 60 62 63 65 67 69 70 72)))
       (m (Index b (MulAdd (LFSaw kr 0.5 -1) 4 4))))
  (Mul (SinOsc ar (Lag2 (MIDICPS m) 0.1) 0) 0.05))
