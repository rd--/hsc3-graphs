; toggle-ff
(let* ((t (dust ar (x-line kr 1 1000 60 do-nothing)))
       (s (sin-osc ar (mul-add (toggle-ff t) 400 800) 0)))
  (mul s 0.05))
