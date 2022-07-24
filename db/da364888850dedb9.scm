; wrapindex
(let* ((b (asLocalBuf 1 (list 200 300 400 500 600 800)))
       (f (WrapIndex b (MouseX 0 18 0 0.1))))
  (Mul (SinOsc f 0) 0.1))
