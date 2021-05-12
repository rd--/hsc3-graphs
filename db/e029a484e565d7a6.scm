; wrapindex
(let* ((b (as-local-buf (list 200 300 400 500 600 800)))
       (f (WrapIndex b (MouseX kr 0 18 0 0.1))))
  (Mul (SinOsc ar f 0) 0.1))
