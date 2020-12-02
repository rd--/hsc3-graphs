; select
(let* ((a (mce3 (sin-osc ar 440 0) (saw ar 440) (pulse ar 440 0.1)))
       (cycle 3/2)
       (w (mul-add (lf-saw kr 1 0) cycle cycle)))
  (mul (select w a) 0.05))
