; amplitude
(let* ((a (amplitude kr (sound-in 0) 0.01 0.01))
       (f (mul-add a 1200 400)))
  (mul (sin-osc ar f 0) 0.1))
