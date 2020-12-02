; num-output-buses
(let ((bus num-output-buses))
  (mul (pulse ar 90 0.3)
       (amplitude kr (lag (in 1 ar bus) 0.1) 0.01 0.01)))
