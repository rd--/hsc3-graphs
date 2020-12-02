; ceil
(let* ((x (mouse-x kr 65 95 0 0.1))
       (f (midi-cps (mce2 (u:floor x) (ceil x)))))
  (mul (sin-osc ar f 0) 0.1))
