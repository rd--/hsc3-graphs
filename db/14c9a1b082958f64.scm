; tgrains
(let* ((b (ctl kr "buf" 0))
       (t-rate (MouseY kr 2 200 1 0.1))
       (dur (FDiv 4 t-rate))
       (t (Impulse ar t-rate 0))
       (i (MouseX kr 0 (BufDur kr b) 0 0.1)))
  (TGrains 2 t b 1 i dur 0 0.1 2))
