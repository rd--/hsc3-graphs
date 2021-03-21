; select
(let* ((n 32)
       (a (midi-cps (u:floor (r-rand-n n 30 80))))
       (cycle (/ n 2))
       (w (mul-add (lf-saw kr 1/2 0) cycle cycle)))
  (mul (saw ar (select w a)) 0.05))
