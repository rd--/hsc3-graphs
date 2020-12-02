; lorenz-l ; frequency control
(let* ((x (mouse-x kr 1 200 0 0.1))
       (c (lorenz-l ar x 10 28 2.667 0.05 0.1 0 0)))
  (mul (sin-osc ar (mul-add (lag c 0.003) 800 900) 0) 0.1))
