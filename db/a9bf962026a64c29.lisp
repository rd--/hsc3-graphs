; alien meadow (jmcc) #6
(u:overlap-texture
 2 6 6
 (lambda (tr)
   (let* ((a (t-rand 0 20 tr))
          (b (t-rand 0 5000 tr))
          (c (t-rand 0 20 tr))
          (p (t-rand -1 1 tr))
          (f (add (mul3 (sin-osc ar a 0) b 0.1) b)))
     (pan2 (sin-osc ar f 0) p (mul-add (sin-osc ar c 0) 0.05 0.05)))))
