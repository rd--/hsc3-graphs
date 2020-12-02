; ringz
(let ((n (mul (white-noise ar) 0.001)))
  (mix-fill
   10
   (lambda (_)
     (let ((f (x-line kr (rand 100 5000) (rand 100 5000) 20 do-nothing)))
       (ringz n f 0.5)))))
