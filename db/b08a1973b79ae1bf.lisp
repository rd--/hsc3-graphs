; t-grains
(let* ((b (ctl kr "buf" 0))
       (t-rate (mouse-y kr 2 200 1 0.1))
       (dur (f-div 4 t-rate))
       (t (impulse ar t-rate 0))
       (i (mouse-x kr 0 (buf-dur kr b) 0 0.1)))
  (t-grains 2 t b 1 i dur 0 0.1 2))
