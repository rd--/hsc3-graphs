; db-amp
(let* ((x (mouse-x kr -60 0 0 0.1))
       (f (mul-add (db-amp x) 200 700)))
  (mul (sin-osc ar f 0) 0.1))
