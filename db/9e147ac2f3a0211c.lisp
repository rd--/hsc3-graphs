; hypot
(let* ((x 10)
       (y (mul (lf-saw kr 1/6 0) 100))
       (distance (hypot x y))
       (amplitude (f-div 40 (squared distance)))
       (sound (rlpf (mul (f-sin-osc ar 200 0) (lf-pulse ar 31.3 0 0.4)) 400 0.3)))
  (mul (delay-l sound 110/344 (f-div distance 344)) amplitude))
