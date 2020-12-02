; forest sounds (paul jones)
(mce-fill
 2
 (lambda (_)
   (let* ((n1 (brown-noise ar))
          (n2 (lf-noise2 kr 50))
          (f (mul-add n2 50 50))
          (o (mul-add (sin-osc kr f 0) 100 2000)))
     (mul (bpf n1 o 0.001) 10))))
