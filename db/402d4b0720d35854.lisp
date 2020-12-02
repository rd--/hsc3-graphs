; last-value
(let* ((x (mouse-x kr 0.1 4 0 0.1))
       (f (mul-add (u:abs (sub x (last-value x 0.5))) 400 200)))
  (mul (sin-osc ar f 0) 0.1))
