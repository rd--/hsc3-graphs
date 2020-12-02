; as-local-buf ; combines local-buf and set-buf
(let* ((b (as-local-buf (list 60 62 63 65 67 69 70 72)))
       (m (index b (mul-add (lf-saw kr 0.5 -1) 4 4))))
  (mul (sin-osc ar (lag2 (midi-cps m) 0.1) 0) 0.05))
