; birdies (jmcc)
(u:overlap-texture
 7 4 4
 (lambda (tr)
   (let* ((p1 (add (mul (lf-pulse kr (t-rand 0.4 1.4 tr) 0 (t-rand 0.1 0.9 tr)) (t-rand 4 7 tr)) 2))
          (p2 (mul (lf-pulse kr (t-rand 0.4 1.4 tr) 0 (t-rand 0.1 0.9 tr)) (t-rand 4 7 tr)))
          (p3 (mul (lf-pulse kr (t-rand 0.2 0.7 tr) 0 0.4) 0.02))
          (sw (add (mul (lf-saw kr (add p1 p2) 0) (neg (t-rand 1000 1800 tr))) (add 4000 (t-rand -1200 1200 tr))))
          (freq (lag sw 0.05))
          (amp (lag p3 0.3)))
     (pan2 (mul (sin-osc ar freq 0) amp) (t-rand -1 1 tr) 1))))
